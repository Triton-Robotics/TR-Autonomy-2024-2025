#!/usr/bin/env bash

# Get the current user
current_user=$(whoami)

#make sure the user is elevated
sudo true

if [ $# -eq 2 ]; then
    port1=$1
    port2=$2
else
    port1="/dev/ttySoc1"
    port2="/dev/ttySoc2"
fi


# Function to clean up and exit
cleanup_exit() {
    echo "Exiting..."
    sudo kill $pid_a 2>/dev/null # Try to kill program 'a' with sudo
    exit 1
}

# Trap SIGINT signal (Ctrl+C) to call cleanup_exit function
trap cleanup_exit SIGINT

# Start program 'a' in the background
sudo socat pty,raw,echo=0,link="$port1" pty,raw,echo=0,link="$port2" &

# Store the PID of program 'a'
pid_a=$!

# Start program 'b' after a delay
(sleep "0.1"; sudo chown $current_user:$current_user "$port1") &

# Start program 'c' after a delay
(sleep "0.1"; sudo chown $current_user:$current_user "$port2") &

# Wait for program 'a' to finish
wait $pid_a

# Notify when all programs have finished
echo "All programs have finished."
