#!/bin/bash

# Check if the argument is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a filename as an argument."
    exit 1
fi

# Run the command with the provided filename
ros2 bag record -o "$1" -s mcap --storage-preset-profile zstd_fast --qos-profile-overrides-path bag.yaml /camera/image
