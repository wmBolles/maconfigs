#!/bin/bash

# Set variables
LAUNCH_AGENT_PATH="$HOME/Library/LaunchAgents/com.user.logout.plist"
LOGOUT_INDICATOR_PATH="$HOME/.logout_indicator"

# Create Launch Agent plist file
echo "Creating Launch Agent plist file..."
cat << EOF > "$LAUNCH_AGENT_PATH"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.logout</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>-c</string>
        <string>echo 0 > ~/thef_scripts/file</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WatchPaths</key>
    <array>
        <string>$LOGOUT_INDICATOR_PATH/trigger</string>
    </array>
</dict>
</plist>
EOF

# Create .logout_indicator directory
echo "Creating .logout_indicator directory..."
mkdir -p "$LOGOUT_INDICATOR_PATH"

# Create the trigger file manually if it doesn't exist
if [ ! -f "$LOGOUT_INDICATOR_PATH/trigger" ]; then
    touch "$LOGOUT_INDICATOR_PATH/trigger"
fi

# Load the Launch Agent
echo "Loading the Launch Agent..."
launchctl load "$LAUNCH_AGENT_PATH"

echo "Setup complete. The command 'echo 0 > ~/thef_scripts/file' will execute when you touch the trigger file in ~/.logout_indicator and then log out."
