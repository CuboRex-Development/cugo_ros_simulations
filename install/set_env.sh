#!/bin/bash
# Apache License 2.0
# Copyright (c) 2023, CuboRex Inc.

echo "Set environment variable"
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/usr/share/gazebo-11/models
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:./install/cugo_ros2_control/share/cugo_ros2_control/models
source /usr/share/gazebo/setup.sh
echo ""
