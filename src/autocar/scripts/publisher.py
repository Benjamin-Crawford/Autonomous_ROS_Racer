#!/usr/bin/env python3

import rospy
from std_msgs.msg import Float64

import os
import time

from docopt import docopt
import numpy as np
import cv2
from simple_pid import PID
from __future__ import division

class LineFollower:
    '''
    OpenCV based controller
    This controller takes a horizontal slice of the image at a set Y coordinate.
    Then it converts to HSV and does a color thresh hold to find the yellow pixels.
    It does a histogram to find the pixel of maximum yellow. Then is uses that iPxel
    to guid a PID controller which seeks to maintain the max yellow at the same point
    in the image.
    '''
    def __init__(self):
        self.vert_scan_y = 300   # num pixels from the top to start horiz scan
        self.vert_scan_height = 30 # num pixels high to grab from horiz scan
        
        self.lower_yellow = np.asarray((15, 50, 50)) # hsv dark yellow
        self.lower_white = np.array([0,0,230], dtype=np.uint8)
        self.upper_white = np.array([255,20,255], dtype=np.uint8)
        self.upper_white = np.array([131, 255, 255]) #hsv bright white
        
        self.target_pixel = None # of the N slots above, which is the ideal relationship target
        self.steering = 0.0 # from -1 to 1
        self.throttle = 0.06 # from -1 to 1
        self.delta_th = 0.0025 # how much to change throttle when off
        self.throttle_max = 0.06
        self.throttle_min = 0.06
        self.pid_st = PID(Kp=-0.0027, Ki=0.00008, Kd=-0.00015)
        #self.pid_st = PID(Kp=-.3, Ki=0.01, Kd=-0.2)
        self.horz_scan_x = 125
        self.horz_scan_width = 500
        self.cam = cv2.VideoCapture(0)


    def take_img(self):
        return_value, cam_img = self.cam.read()
        cam_img = cv2.cvtColor(cam_img,cv2.COLOR_RGB2BGR)
        return cam_img

    def take_avg_img(self,num_imgs):
        sum_img = self.take_img() #always take at least one image

        #for the rest of the images take them one at a time and add up
        for i in range(num_imgs - 1):
            sum_img = sum_img + self.take_img()
        
        return (sum_img / num_imgs)


    def get_i_color(self):
        '''
        get the horizontal index of the color at the given slice of the image
        input: cam_image, an RGB numpy array
        output: index of max color, value of cumulative color at that index, and mask of pixels in range
        '''
        cam_img = self.take_img()
        # take a horizontal slice of the image
        iSlice = self.vert_scan_y
        scan_line = cam_img[iSlice : iSlice + self.vert_scan_height, self.horz_scan_x : self.horz_scan_x + self.horz_scan_width, :]

        # convert to HSV color space
        img_hsv = cv2.cvtColor(scan_line, cv2.COLOR_RGB2HSV)


        # make a mask of the colors in our range we are looking for
        yellow_mask = cv2.inRange(img_hsv, self.lower_yellow, self.upper_yellow)
        white_mask = cv2.inRange(img_hsv, self.lower_white, self.upper_white)

        yellow_mask = self.remove_noise(yellow_mask)
        white_mask = self.remove_noise(white_mask)

        yellow_centroid_x = self.find_centroids(yellow_mask)
        white_centroid_x = self.find_centroids(white_mask)

        return yellow_centroid_x, white_centroid_x

    def remove_noise(self, mask):
        # Remove noise
        kernel_erode = np.ones((4,4), np.uint8)
        eroded_mask = cv2.erode(mask, kernel_erode, iterations=1)
        kernel_dilate = np.ones((6,6),np.uint8)
        dilated_mask = cv2.dilate(eroded_mask, kernel_dilate, iterations=1)
        return dilated_mask

    def find_centroids(self, mask):
        # Find the different contours
        contours, hiearchy = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        # Sort by area (keep only the biggest one)
        contours = sorted(contours, key=cv2.contourArea, reverse=True)[:1]

        hist = np.sum(mask, axis=0)
        mask_max = np.argmax(hist)

        if len(contours) > 0:
            M = cv2.moments(contours[0])
            # Centroid
            if int(abs(M['m00'])) > 0:
                cx = int(M['m10']/M['m00'])
                cy = int(M['m01']/M['m00'])
                print("Centroid of the biggest area: ({}, {})".format(cx, cy))
                return int(((cx + mask_max) / 2)//1)
            else:
                print("No Centroid Found")
                return mask_max
        else:
            print("No Centroid Found")
            return mask_max


    def run(self):
        '''
        main runloop of the CV controller
        input: cam_image, an RGB numpy array
        output: steering, throttle, and recording flag
        '''
        yellow_centroid_x, white_centroid_x = self.get_i_color()
        white_centroid_x = -1
        if self.target_pixel is None and yellow_centroid_x > 0:
            # Use the first run of get_i_color to set our relationship with the yellow line.
            # You could optionally init the target_pixel with the desired value.
            self.target_pixel = yellow_centroid_x

            # this is the target of our steering PID controller
            self.pid_st.setpoint = self.target_pixel 

        elif self.target_pixel is None and white_centroid_x > 0:
            # Use the first run of get_i_color to set our relationship with the yellow line.
            # You could optionally init the target_pixel with the desired value.
            self.target_pixel = white_centroid_x

            # this is the target of our steering PID controller
            self.pid_st.setpoint = self.target_pixel

        #First if there is a yellow and a white centroid then we want to be in the middle of them
        elif yellow_centroid_x > 0 and white_centroid_x > 0:
            self.steering = self.pid_st((yellow_centroid_x + white_centroid_x)/2)

            # slow down linearly when away from ideal, and speed up when close
            if abs(yellow_centroid_x - self.target_pixel) > 50:
                if self.throttle > self.throttle_min:
                    self.throttle -= self.delta_th
            else:
                if self.throttle < self.throttle_max:
                    self.throttle += self.delta_th

        #second if there is only a yellow centroid then we want to go to it
        elif yellow_centroid_x > 0 and white_centroid_x < 0:
            self.steering = self.pid_st(yellow_centroid_x)
            # slow down linearly when away from ideal, and speed up when close
            if abs(yellow_centroid_x - self.target_pixel) > 50:
                if self.throttle > self.throttle_min:
                    self.throttle -= self.delta_th
            else:
                if self.throttle < self.throttle_max:
                    self.throttle += self.delta_th

        #third if there is only a white centroid follow it
        elif white_centroid_x > 0 and yellow_centroid_x < 0:
            self.steering = self.pid_st(white_centroid_x)
            # slow down linearly when away from ideal, and speed up when close
            if abs(white_centroid_x - self.target_pixel) > 50:
                if self.throttle > self.throttle_min:
                    self.throttle -= self.delta_th
            else:
                if self.throttle < self.throttle_max:
                    self.throttle += self.delta_th

        # show some diagnostics
        print("steering: "+ str(self.steering))
        print("throttle: " + str(self.throttle))
        return self.steering, self.throttle

def pub():
    steer_pub = rospy.Publisher('steering', Float64, queue_size=10)
    throttle_pub = rospy.Publisher('throttle', Float64, queue_size = 10)
    rospy.init_node('pub', anonymous=True)
    rate = rospy.Rate(30) # 20hz
    follower = LineFollower()
    while not rospy.is_shutdown():
        steering, throttle = follower.run()
        rospy.loginfo(steering)
        rospy.loginfo(throttle)

        throttle_pub.publish(throttle)
        steer_pub.publish(steering)
        rate.sleep()

    #on shutdown stop car and straighten wheels
    throttle_pub.publish(0)
    steer_pub.publish(0)

if __name__ == '__main__':
    try:
        pub()
    except rospy.ROSInterruptException:
        pass
