# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "autocar: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iautocar:/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(autocar_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg" NAME_WE)
add_custom_target(_autocar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "autocar" "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(autocar
  "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autocar
)

### Generating Services

### Generating Module File
_generate_module_cpp(autocar
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autocar
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(autocar_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(autocar_generate_messages autocar_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg" NAME_WE)
add_dependencies(autocar_generate_messages_cpp _autocar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autocar_gencpp)
add_dependencies(autocar_gencpp autocar_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autocar_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(autocar
  "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autocar
)

### Generating Services

### Generating Module File
_generate_module_eus(autocar
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autocar
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(autocar_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(autocar_generate_messages autocar_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg" NAME_WE)
add_dependencies(autocar_generate_messages_eus _autocar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autocar_geneus)
add_dependencies(autocar_geneus autocar_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autocar_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(autocar
  "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autocar
)

### Generating Services

### Generating Module File
_generate_module_lisp(autocar
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autocar
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(autocar_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(autocar_generate_messages autocar_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg" NAME_WE)
add_dependencies(autocar_generate_messages_lisp _autocar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autocar_genlisp)
add_dependencies(autocar_genlisp autocar_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autocar_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(autocar
  "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autocar
)

### Generating Services

### Generating Module File
_generate_module_nodejs(autocar
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autocar
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(autocar_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(autocar_generate_messages autocar_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg" NAME_WE)
add_dependencies(autocar_generate_messages_nodejs _autocar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autocar_gennodejs)
add_dependencies(autocar_gennodejs autocar_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autocar_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(autocar
  "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autocar
)

### Generating Services

### Generating Module File
_generate_module_py(autocar
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autocar
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(autocar_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(autocar_generate_messages autocar_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/projects/d3/Autonomous_ROS_Racer/src/autocar/msg/Values.msg" NAME_WE)
add_dependencies(autocar_generate_messages_py _autocar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autocar_genpy)
add_dependencies(autocar_genpy autocar_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autocar_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autocar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autocar
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(autocar_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autocar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autocar
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(autocar_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autocar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autocar
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(autocar_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autocar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autocar
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(autocar_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autocar)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autocar\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autocar
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(autocar_generate_messages_py std_msgs_generate_messages_py)
endif()
