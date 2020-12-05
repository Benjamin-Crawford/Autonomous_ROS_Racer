
(cl:in-package :asdf)

(defsystem "autocar-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Values" :depends-on ("_package_Values"))
    (:file "_package_Values" :depends-on ("_package"))
  ))