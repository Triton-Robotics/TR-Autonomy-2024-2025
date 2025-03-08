#!/bin/bash

<<comment
launch all the nodes for aim-to-center on the real robot
comment

chmod u+x ./node.bash
gnome-terminal --tab -- bash -c "./node.bash camera_node camera_node; exec bash"
gnome-terminal --tab -- bash -c "./node.bash detector_node detector_node; exec bash"
gnome-terminal --tab -- bash -c "./node.bash aiming_node aiming_node; exec bash"
gnome-terminal --tab -- bash -c "./node.bash serial_service server; exec bash"