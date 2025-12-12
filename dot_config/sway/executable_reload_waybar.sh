#!/bin/bash

# Check if Waybar is already running
if pgrep -x "waybar" > /dev/null; then
    # Waybar is already running, so do nothing
    exit 0
else
    # Waybar is not running, so start it in the background
    waybar -c ~/.config/waybar/config-sway.jsonc &
fi

# You can add other startup applications here using the same pattern
# For example, for nm-applet:
# if ! pgrep -x "nm-applet" > /dev/null; then
#     nm-applet &
# fi
