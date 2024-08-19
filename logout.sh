
#!/bin/bash

# Set variables
LOGOUT_INDICATOR_PATH="$HOME/.logout_indicator"

# Create .logout_indicator directory
echo "Creating .logout_indicator directory..."
mkdir -p "$LOGOUT_INDICATOR_PATH"

# Create the trigger file manually if it doesn't exist
if [ ! -f "$LOGOUT_INDICATOR_PATH/trigger" ]; then
    touch "$LOGOUT_INDICATOR_PATH/trigger"
fi

# Create a simple shell script to handle the command execution
SCRIPT_PATH="$HOME/.handle_logout.sh"
echo "Creating logout handler script..."
cat << EOF > "$SCRIPT_PATH"
#!/bin/bash
if [ -f "$LOGOUT_INDICATOR_PATH/trigger" ]; then
    echo 0 > ~/thef_scripts/file
    rm "$LOGOUT_INDICATOR_PATH/trigger"
fi
EOF

# Make the script executable
chmod +x "$SCRIPT_PATH"

# Inform the user to manually execute the script when needed
echo "Setup complete. Run the following command before logging out to execute your desired action:"
echo "    $SCRIPT_PATH"
