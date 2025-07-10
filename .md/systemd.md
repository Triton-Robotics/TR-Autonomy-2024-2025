# systemd services

## Introduction

Systemd can be used to link service files that define a task to execute on startup.

To have a service file run on boot you must first **link** it, then **enable** it, to have the service run immediately without a reboot you must **start** it.

To stop active services running you must **stop** it, and to prevent it running on future reboots, you must **disable** it.

## example

```
# enabling and starting a service
sudo systemctl link [/path/to/launch_ros_node@.service]
sudo systemctl enable launch_ros_node@[your_node].service
sudo systemctl daemon-reload
sudo systemctl start launch_ros_node@[your_node].service

# stopping and disabling a service
sudo systemctl stop launch_ros_node@[your_node].service
sudo systemctl disable launch_ros_node@[your_node].service
```

## Enabling and Disabling Entire Autonomy Stack

```
# enable and start all nodes for comp environment 
# in root directory of this repository
./services/scripts/enable_and_start_comp.bash

# disable and stop all nodes for comp environment
./services/scripts/disable_and_stop_comp.bash
```

## Helpful Commands

```
# view status of a particular service
sudo systemctl status launch_ros_node@[your_node].service

# view stdout of a particular service 
sudo journalclt -u launch_ros_node@[your_node].service -f -b
```
