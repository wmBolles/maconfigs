#!/bin/bash

# Set variables
LAUNCH_AGENT_PATH="$HOME/Library/LaunchAgents/com.user.logout.plist"
LOGOUT_INDICATOR_PATH="$HOME/.logout_indicator"
LOGOUT_HOOK_SCRIPT="$HOME/.logout_hook.sh"

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
        <string>$LOGOUT_INDICATOR_PATH</string>
    </array>
    <key>QueueDirectories</key>
    <array>
        <string>$LOGOUT_INDICATOR_PATH</string>
    </array>
</dict>
</plist>
EOF

# Create .logout_indicator directory
echo "Creating .logout_indicator directory..."
mkdir -p "$LOGOUT_INDICATOR_PATH"

# Create logout hook script
echo "Creating logout hook script..."
cat << EOF > "$LOGOUT_HOOK_SCRIPT"
#!/bin/sh
rm $LOGOUT_INDICATOR_PATH/trigger
EOF

# Make the logout hook script executable
chmod +x "$LOGOUT_HOOK_SCRIPT"

# Register the logout hook (This part requires sudo, so it will not work without it)
# However, if you can't use sudo, this part can be skipped.
if [ -x "$(command -v sudo)" ]; then
    echo "Registering the logout hook..."
    sudo defaults write com.apple.loginwindow LogoutHook "$LOGOUT_HOOK_SCRIPT"
else
    echo "Skipping registration of the logout hook due to lack of sudo privileges."
    echo "You'll need to manually execute the logout hook script to simulate a logout trigger."
fi

# Inform the user about manual steps
echo "Setup complete. However, due to the lack of sudo privileges, the logout hook wasn't registered."
echo "You'll need to manually execute the logout hook script with:"
echo "    $LOGOUT_HOOK_SCRIPT"
echo "or simply touch the trigger file with:"
echo "    touch $LOGOUT_INDICATOR_PATH/trigger"
