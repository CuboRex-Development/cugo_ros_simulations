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
sudo apt install -y ros-foxy-gazebo-*
echo ""

echo "Install turtlebot3 packages"
sudo apt install -y ros-foxy-dynamixel-sdk
sudo apt install -y ros-foxy-turtlebot3-msgs
sudo apt install -y ros-foxy-turtlebot3
cd ../..
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
echo ""

echo "Install other dependencies"
sudo apt install -y python3-colcon-common-extensions
sudo apt install -y python3-argcomplete
sudo apt install -y python3-vcstool
sudo apt install -y ros-foxy-v4l2-camera
sudo apt install -y ros-foxy-controller-manager
sudo apt install -y ros-foxy-cv-bridge
sudo apt install -y ros-foxy-diff-drive-controller
sudo apt install -y ros-foxy-effort-controllers
sudo apt install -y ros-foxy-joint-state-publisher
sudo apt install -y ros-foxy-joint-state-publisher-gui
sudo apt install -y ros-foxy-joint-trajectory-controller
sudo apt install -y ros-foxy-joint-state-broadcaster
sudo apt install -y ros-foxy-joint-state-controller
sudo apt install -y ros-foxy-ros2-controllers
sudo apt install -y ros-foxy-tf2
sudo apt install -y ros-foxy-tf2-tools
sudo apt install -y ros-foxy-xacro
sudo apt install -y ros-foxy-slam-toolbox
echo ""

echo "Install navigation2"
sudo apt install -y ros-foxy-navigation2
sudo apt install -y ros-foxy-nav2-bringup
echo ""

cd ../
colcon build --symlink-install
