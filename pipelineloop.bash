#!/bin/bash

# Array to store PIDs of background processes
pids=()

# Function to start watchdog.bash with arguments in the background
start_watchdog() {
    ./watchdog.bash "$@" &
    pids+=($!)  # Store the PID of the background process
}

# Trap termination signals to kill all background processes
cleanup() {
    echo "Terminating background processes..."
    for pid in "${pids[@]}"; do
        kill -TERM "$pid"  # Send termination signal to each background process
    done
    exit 0
}

# Trap termination signals and call cleanup function
trap cleanup SIGINT SIGTERM

# Start each watchdog.bash instance in the background
start_watchdog 'camera_node camera_node'
start_watchdog 'detector_node detector_node'
start_watchdog 'classical_node classical_node'
start_watchdog 'uart_node uart_node'

# Wait for all background processes to finish
wait

