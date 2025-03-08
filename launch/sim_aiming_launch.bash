#!/bin/bash

<<comment
launch all the nodes for aim-to-center on the simulation
comment


chmod u+x ./node.bash
gnome-terminal --tab -- bash -c "./node.bash sim_node sim_node; exec bash"
gnome-terminal --tab -- bash -c "./node.bash aiming_node aiming_node; exec bash"
gnome-terminal --tab -- bash -c "./node.bash detector_node detector_node; exec bash"