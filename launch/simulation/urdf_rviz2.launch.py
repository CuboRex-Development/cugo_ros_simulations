import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():

    package_dir = get_package_share_directory("cugo_ros2_control")
    rviz = os.path.join(package_dir, "rviz" , "urdf.rviz")
    urdf = os.path.join(package_dir, "models", "cugo_v3", "cugo_v3.urdf")

    return LaunchDescription([

        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            name='robot_state_publisher',
            arguments=[urdf]
            ),

        Node(
            package='joint_state_publisher_gui',
            executable='joint_state_publisher_gui',
            name='joint_state_publisher_gui',
            arguments=[urdf]
            ),

        Node(
            package="rviz2",
            executable="rviz2",
            name="rviz2",
            arguments=["-d", rviz]
            ),
    ])