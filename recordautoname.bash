#!/bin/bash
source install/setup.bash
./run_camera_loop.bash &
# Run the command with the provided filename
while true
do
	ros2 bag record -d 30 --qos-profile-overrides-path bag.yaml /camera/image/compressed
	sleep 0.1
done
