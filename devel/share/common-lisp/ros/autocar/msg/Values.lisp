; Auto-generated. Do not edit!


(cl:in-package autocar-msg)


;//! \htmlinclude Values.msg.html

(cl:defclass <Values> (roslisp-msg-protocol:ros-message)
  ((throttle
    :reader throttle
    :initarg :throttle
    :type cl:float
    :initform 0.0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:float
    :initform 0.0))
)

(cl:defclass Values (<Values>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Values>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Values)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autocar-msg:<Values> is deprecated: use autocar-msg:Values instead.")))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <Values>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autocar-msg:throttle-val is deprecated.  Use autocar-msg:throttle instead.")
  (throttle m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <Values>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autocar-msg:steering-val is deprecated.  Use autocar-msg:steering instead.")
  (steering m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Values>) ostream)
  "Serializes a message object of type '<Values>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Values>) istream)
  "Deserializes a message object of type '<Values>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'throttle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Values>)))
  "Returns string type for a message object of type '<Values>"
  "autocar/Values")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Values)))
  "Returns string type for a message object of type 'Values"
  "autocar/Values")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Values>)))
  "Returns md5sum for a message object of type '<Values>"
  "39f463d271c2ca10c14182802c72c029")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Values)))
  "Returns md5sum for a message object of type 'Values"
  "39f463d271c2ca10c14182802c72c029")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Values>)))
  "Returns full string definition for message of type '<Values>"
  (cl:format cl:nil "float64 throttle~%float64 steering~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Values)))
  "Returns full string definition for message of type 'Values"
  (cl:format cl:nil "float64 throttle~%float64 steering~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Values>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Values>))
  "Converts a ROS message object to a list"
  (cl:list 'Values
    (cl:cons ':throttle (throttle msg))
    (cl:cons ':steering (steering msg))
))
