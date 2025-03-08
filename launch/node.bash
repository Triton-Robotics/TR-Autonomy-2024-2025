#!/bin/bash

<<comment
this is a sub-script to be called by other launch scripts it represents
a single tab that runs a node with the given name and executable
comment

NODE_NAME=$1
EXECUTABLE=$2

cd ..
source /opt/ros/humble/setup.bash
source install/setup.bash
ros2 run "$NODE_NAME" "$EXECUTABLE" --ros-args --params-file params.yaml