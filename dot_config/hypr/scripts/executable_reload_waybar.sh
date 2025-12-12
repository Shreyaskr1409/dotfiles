# #!/bin/bash
#
# # Check if Waybar is already running
# if pgrep -x "waybar" > /dev/null; then
#     # Waybar is already running, so do nothing
#     exit 0
# else
#     # Waybar is not running, so start it in the background
#     waybar &
# fi
#
# # You can add other startup applications here using the same pattern
# # For example, for nm-applet:
# # if ! pgrep -x "nm-applet" > /dev/null; then
# #     nm-applet &
# # fi

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

# You can add other startup applications here using the same pattern
# For example, for nm-applet:
# if ! pgrep -x "nm-applet" > /dev/null; then
#     nm-applet &
# fi
