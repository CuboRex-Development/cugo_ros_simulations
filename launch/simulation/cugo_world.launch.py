import os

from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node

def generate_launch_description():
    use_sim_time = LaunchConfiguration('use_sim_time', default='true')

    world_file_name = 'cugo_worlds/cugo.model'
    world = os.path.join(get_package_share_directory('cugo_ros2_control'),
                         'worlds', world_file_name)

    launch_file_dir = os.path.join(get_package_share_directory('cugo_ros2_control'), 'launch')
    pkg_gazebo_ros = get_package_share_directory('gazebo_ros')

    package_dir = get_package_share_directory("cugo_ros2_control")
    #urdf = os.path.join(package_dir, "urdf", "xacro", "cugo.urdf")
    urdf = os.path.join(package_dir, "models", "cugo", "cugo.urdf")

    print("world: ", world)
    print("urdf path: ", urdf)

    return LaunchDescription([
        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(pkg_gazebo_ros, 'launch', 'gzserver.launch.py')
            ),
            launch_arguments={'world': world}.items(),
        ),

        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(pkg_gazebo_ros, 'launch', 'gzclient.launch.py')
            ),
        ),

        #IncludeLaunchDescription(
        #    PythonLaunchDescriptionSource([launch_file_dir, '/robot_state_publisher.launch.py']),
        #    launch_arguments={'use_sim_time': use_sim_time}.items(),
        #),

        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            name='robot_state_publisher',
            output='screen',
            parameters=[{'use_sim_time': use_sim_time}],
            arguments=[urdf],
            ),

        Node(
            package='joint_state_publisher',
            executable='joint_state_publisher',
            name='joint_state_publisher',
            output='screen',
            parameters=[{'use_sim_time': use_sim_time}],
            arguments=[urdf],
            ),

        ## gazebo settings
        #ExecuteProcess(
        #    cmd=["gazebo", "--verbose", "-s", "libgazebo_ros_factory.so"],
        #    ),

        #Node(
        #    package="gazebo_ros",
        #    executable="spawn_entity.py",
        #    name="urdf_spawner",
        #    parameters=[{'use_sim_time': use_sim_time}],
        #    arguments=["-topic", "/robot_description", "-entity", "cugo_test"]),
    ])
