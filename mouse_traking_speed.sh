#!/bin/bash

MOUSE_SPEED_FILE="$HOME/.mouse_speed"
INCREMENT=1.5

if [ -f "$MOUSE_SPEED_FILE" ]; then
    CURRENT_SPEED=$(cat "$MOUSE_SPEED_FILE")
else
    CURRENT_SPEED=1.0
fi

echo "Current speed: $CURRENT_SPEED"
NEW_SPEED=$(echo "$CURRENT_SPEED + $INCREMENT" | bc)
echo "New speed: $NEW_SPEED"

defaults write -g com.apple.mouse.scaling -float "$NEW_SPEED"
echo "Mouse speed set to $NEW_SPEED"
echo "$NEW_SPEED" > "$MOUSE_SPEED_FILE"

killall SystemUIServer
killall Dock
