# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/19 17:47:53 by wabolles          #+#    #+#              #
#    Updated: 2024/08/19 17:53:46 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Define the command you want to run when the process ends
cmd=zero
COMMAND_TO_RUN="$cmd"

# Define the name of the script to be created
SCRIPT_PATH="$HOME/monitor_process.sh"

# Create the monitoring script
cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash

# Define the command to run when the process ends
COMMAND_TO_RUN="/path/to/your/command"

# Get the name of the most recent process (excluding system processes)
PROCESS_NAME=$(ps -eo pid,comm --sort=-start_time | awk 'NR==2 {print $2}')

# Check if we successfully got a process name
if [ -z "$PROCESS_NAME" ]; then
    echo "No process found to monitor."
    exit 1
fi

echo "Monitoring process: $PROCESS_NAME"

while true; do
    # Check if the process is still running
    if ! pgrep "$PROCESS_NAME" > /dev/null; then
        # Run the command when the process ends
        echo "Process $PROCESS_NAME ended. Running command."
        $COMMAND_TO_RUN
        exit 0
    fi
    sleep 5
done
EOF

# Make the monitoring script executable
chmod +x "$SCRIPT_PATH"

# Add the script to .bash_profile or .zshrc for automatic startup
if [ -f "$HOME/.bash_profile" ]; then
    echo "$SCRIPT_PATH &" >> "$HOME/.bash_profile"
elif [ -f "$HOME/.zshrc" ]; then
    echo "$SCRIPT_PATH &" >> "$HOME/.zshrc"
else
    echo "No .bash_profile or .zshrc found. Please add $SCRIPT_PATH & to your shell profile manually."
fi

echo "Setup complete. The monitoring script will start on your next login."

bash ~/monitor_process.sh