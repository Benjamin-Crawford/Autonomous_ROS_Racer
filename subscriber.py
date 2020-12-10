import time
import rospy
from std_msgs.msg import Float64
from adafruit_servokit import ServoKit


def map_range(x, X_min, X_max, Y_min, Y_max):
    '''
    Linear mapping between two ranges of values
    '''
    X_range = X_max - X_min
    Y_range = Y_max - Y_min
    XY_ratio = X_range/Y_range

    y = ((x-X_min) / XY_ratio + Y_min) // 1

    return int(y)

class PWMSteering:
    """
    Wrapper over a PWM motor controller to convert angles to PWM pulses.
    """
    LEFT_ANGLE = -1
    RIGHT_ANGLE = 1

    def __init__(self,controller=None,left_pulse=1000,right_pulse=2000):

        self.controller = controller

        self.left_pulse = left_pulse
        self.right_pulse = right_pulse

        self.pulse = map_range(0, self.LEFT_ANGLE, self.RIGHT_ANGLE, self.left_pulse, self.right_pulse)
        self.controller.set_pulse_width_range(self.left_pulse, self.right_pulse) # set the min and max pulse width
        print('PWM Steering created')

    def run(self, angle):
        self.pulse = map_range(angle, self.LEFT_ANGLE, self.RIGHT_ANGLE, 0, 180)
        print("steering: " + str(self.pulse))
        self.controller.angle(self.pulse)

    def shutdown(self):
        # set steering straight
        self.pulse = 0
        time.sleep(0.3)
        self.running = False


class PWMThrottle:
    """
    Wrapper over a PWM motor controller to convert -1 to 1 throttle
    values to PWM pulses.
    """

    def __init__(self, controller=None):
        self.controller = controller
        self.pulse = 0
        # send zero pulse to calibrate ESC
        self.controller.throttle(self.pulse)
        print('PWM Throttle created')

    def run(self, throttle):
        print("throttle: " + str(self.pulse))
        self.pulse = throttle
        self.controller.throttle(self.pulse)

    def shutdown(self):
        # stop vehicle
        self.run(0)


class Config():
    def __init__(self, STEERING_CHANNEL = 4,
                       THROTTLE_CHANNEL = 5, 
                       TOTAL_CHANNELS = 16):
        self.STEERING_CHANNEL  = STEERING_CHANNEL
        self.THROTTLE_CHANNEL = THROTTLE_CHANNEL
        self.TOTAL_CHANNELS = TOTAL_CHANNELS

cfg = Config()
kit = ServoKit(channels=cfg.TOTAL_CHANNELS)

steering = PWMSteering(controller=kit.servo[cfg.STEERING_CHANNEL])
throttle = PWMThrottle(controller=kit.continuous_servo[cfg.THROTTLE_CHANNEL])


def throttle_callback(data):
    throttle.run(data)

def steering_callback(data):
    steering.run(data)


def listener():
    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber('steering', Float64, throttle_callback)
    rospy.Subscriber('throttle', Float64, steering_callback)

    rospy.spin()

if __name__ == '__main__':
    listener()

#     V.add(steering, inputs=['angle'], threaded=True)
#     V.add(throttle, inputs=['throttle'], threaded=True)