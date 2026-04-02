#!/bin/bash

# Check if Waybar is already running
if pgrep -x "waybar" > /dev/null; then
    echo "Waybar is running. Killing existing instance..."
    # Kill all waybar processes
    pkill -x "waybar"
    # Wait a moment for processes to terminate
    sleep 0.5
fi

# Start Waybar in the background
echo "Starting Waybar..."
waybar -c ~/.config/waybar/config-hypr.jsonc &

# Optional: Wait a moment and check if Waybar started successfully
sleep 1
if pgrep -x "waybar" > /dev/null; then
    echo "Waybar started successfully!"
else
    echo "Failed to start Waybar!"
    exit 1
fi
