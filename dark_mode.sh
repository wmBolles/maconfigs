#!/bin/bash

osascript <<EOF
tell application "System Events"
    tell appearance preferences
        set dark mode to true
    end tell
end tell
EOF
