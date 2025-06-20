# TR-Autonomy-2025
Parent repository for Triton Robotics Autonomy team. It contains the setup files to run on Jetson boot (when connected to the robot), and contains the submodules of all the necessary child nodes. 

This repository should only include final, runnable code that follows coding conventions in [Styles.md](./Styles.md) and works on our Jetson.

## Launching
To prevent the overhead of making multiple terminals, we have setup launch files such as [sim_aiming_launch.bash](./launch/sim_aiming_launch.bash) to more easily run multiple terminals. To run a launch file, all you have to do is navigate into the launch directory, add permissions to run the script (do this for all scripts you plan to run), and then run it.
```
cd ./launch
chmod u+x ./sim_aiming_launch.bash
./sim_aiming_launch.bash
```

## systemd services 

### First time setup
```
sudo systemctl link [/path/to/launch_ros_node@.service]

# example "launch_ros_node@camera_node.service"
sudo systemctl enable launch_ros_node@[your_node].service
sudo systemctl daemon-reload
sudo systemctl start launch_ros_node@[your_node].service
```
### other helpful commands
```
# if a node stops running / fails instead of restarting the system you can run this command
sudo systemctl restart <service>.service

# status of all our defined .service units running
systemctl list-units --type=service | grep "launch_ros_node@"

# check if our .service units are enabled to run on boot or not
# enabled   enabled = the service will automatically start on boot
# linked    enabled = the service is linked to systems (using the systemctl link command we used earlier) but will not start on boot
# run the enable and disable commands to change this 
systemctl list-unit-files --type=service | grep "launch_ros_node@"

#view std out of a particular node
sudo journalctl -u launch_ros_node@<your_node>.service -f -b
```

### ROS bag recordings
```
sudo systemctl link /home/triton/Documents/cv-dev/TR-Autonomy-2024-2025/services/rosbag.service 
sudo systemctl enable rosbag.service
sudo systemctl disable rosbag.service
sudo systemctl status rosbag.service
sudo systemctl stop rosbag.service
``` 
### link / enable / disable all nodes, jetson overclock startup (NO ROS BAGS)
#### link 

```
chmod +x services/scripts/jetson_startup.bash 

sudo systemctl link /home/triton/Documents/cv-dev/TR-Autonomy-2024-2025/services/launch_ros_node@.service /home/triton/Documents/cv-dev/TR-Autonomy-2024-2025/services/yolox.service /home/triton/Documents/cv-dev/TR-Autonomy-2024-2025/services/jetson_setup_tr.service 
```

#### enable
```
sudo systemctl enable launch_ros_node@stm32_bridge.service launch_ros_node@camera_node.service launch_ros_node@classical_node launch_ros_node@aiming_node.service yolox.service jetson_setup_tr.service
```

#### disable
```
sudo systemctl disable launch_ros_node@stm32_bridge.service launch_ros_node@camera_node.service launch_ros_node@classical_node launch_ros_node@aiming_node.service yolox.service jetson_setup_tr.service
```

#### stop
```
sudo systemctl stop launch_ros_node@stm32_bridge.service launch_ros_node@camera_node.service launch_ros_node@classical_node launch_ros_node@aiming_node.service yolox.service jetson_setup_tr.service
```

## Jetson setup from scratch
[jetson setup](.md/jetson_setup.md)
