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
