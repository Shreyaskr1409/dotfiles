#!/bin/bash

# Kill existing swaybg instances
pkill swaybg
# Wait a moment
sleep 0.5
# Start new swaybg instance
swaybg -i "/home/shrey/Documents/wallpapers/john-towner-3Kv48NS4WUU-unsplash.jpg" -m fill &

# # Initialize swww and set wallpaper
# swww init && swww img "/home/shrey/Documents/wallpapers/john-towner-3Kv48NS4WUU-unsplash.jpg"
