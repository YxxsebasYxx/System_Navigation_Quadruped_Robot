#!/bin/bash
set -e
# Carga ROS2 Jazzy
source /opt/ros/jazzy/setup.bash
# Carga tu workspace
source /ros2_ws/install/setup.bash
exec "$@"
