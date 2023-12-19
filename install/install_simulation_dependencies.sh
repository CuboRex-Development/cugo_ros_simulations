#!/bin/bash
# Apache License 2.0
# Copyright (c) 2023, CuboRex Inc.

echo ""
echo "Install Gazebo packages and turtlebot3 packages used by CuGo."
echo ""

echo "Install Gazebo"
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt update
sudo apt install -y gazebo11
sudo apt install -y libgazebo11-dev
sudo apt install -y ros-$ROS_DISTRO-gazebo-*
echo ""

echo "Install turtlebot3 packages"
sudo apt install -y ros-$ROS_DISTRO-dynamixel-sdk
sudo apt install -y ros-$ROS_DISTRO-turtlebot3-msgs
sudo apt install -y ros-$ROS_DISTRO-turtlebot3
cd ../..
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
echo ""

echo "Install other dependencies"
sudo apt install -y python3-colcon-common-extensions
sudo apt install -y python3-argcomplete
sudo apt install -y python3-vcstool
sudo apt install -y ros-$ROS_DISTRO-v4l2-camera
sudo apt install -y ros-$ROS_DISTRO-controller-manager
sudo apt install -y ros-$ROS_DISTRO-cv-bridge
sudo apt install -y ros-$ROS_DISTRO-diff-drive-controller
sudo apt install -y ros-$ROS_DISTRO-effort-controllers
sudo apt install -y ros-$ROS_DISTRO-joint-state-publisher
sudo apt install -y ros-$ROS_DISTRO-joint-state-publisher-gui
sudo apt install -y ros-$ROS_DISTRO-joint-trajectory-controller
sudo apt install -y ros-$ROS_DISTRO-joint-state-broadcaster
sudo apt install -y ros-$ROS_DISTRO-joint-state-controller
sudo apt install -y ros-$ROS_DISTRO-ros2-controllers
sudo apt install -y ros-$ROS_DISTRO-tf2
sudo apt install -y ros-$ROS_DISTRO-tf2-tools
sudo apt install -y ros-$ROS_DISTRO-xacro
sudo apt install -y ros-$ROS_DISTRO-slam-toolbox
echo ""

echo "Install navigation2"
sudo apt install -y ros-$ROS_DISTRO-navigation2
sudo apt install -y ros-$ROS_DISTRO-nav2-bringup
echo ""

cd ../
colcon build --symlink-install
