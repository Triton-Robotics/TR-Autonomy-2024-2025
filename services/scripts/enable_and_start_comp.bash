chmod +x services/scripts/jetson_startup.bash 
sudo systemctl link /home/triton/Documents/cv-dev/TR-Autonomy-2024-2025/services/launch_ros_node@.service /home/triton/Documents/cv-dev/TR-Autonomy-2024-2025/services/yolox.service /home/triton/Documents/cv-dev/TR-Autonomy-2024-2025/services/jetson_setup_tr.service 
sudo systemctl enable launch_ros_node@stm32_bridge.service launch_ros_node@camera_node.service launch_ros_node@classical_node launch_ros_node@aiming_node.service yolox.service jetson_setup_tr.service
sudo systemctl start launch_ros_node@stm32_bridge.service launch_ros_node@camera_node.service launch_ros_node@classical_node launch_ros_node@aiming_node.service yolox.service jetson_setup_tr.service
