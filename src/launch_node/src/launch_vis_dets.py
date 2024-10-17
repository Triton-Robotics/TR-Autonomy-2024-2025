from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='camera_node',
            namespace='camera_node',
            executable='camera_node',
            name='camera'
        ),
        Node(
            package='detector_node',
            namespace='detector_node',
            executable='detector_node',
            name='detector'
        ),
        Node(
            package='vis_nodes',
            namespace='vis_nodes',
            executable='vis_dets',
            name='visualizer'
        ),
        Node(
            package='rqt_gui',
            executable='rqt',
            name='rqt'
        )
    ])