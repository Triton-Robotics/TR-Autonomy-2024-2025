#!/bin/bash

<<comment
launch all the nodes for aim-to-center on the real robot
comment

chmod u+x ./launch/node.bash
gnome-terminal --tab --title stm32_bridge -- bash -c "./launch/node.bash stm32_bridge stm32_bridge; exec bash"
gnome-terminal --tab --title camera -- bash -c "./launch/node.bash camera_node camera_node; exec bash"
gnome-terminal --tab --title detector -- bash -c "./launch/node.bash detector_node detector_node; exec bash"
gnome-terminal --tab --title vis_node -- bash -c "./launch/node.bash vis_nodes vis_dets; exec bash"
gnome-terminal --tab --title aiming -- bash -c "./launch/node.bash aiming_node aiming_node; exec bash"
gnome-terminal --tab --title "rqt" -- bash -c "source /opt/ros/humble/setup.bash; source install/setup.bash; rqt; exec bash"

