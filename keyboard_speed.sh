#!/bin/bash

# Set aggressive values for faster keyboard repeat
# KeyRepeat:
# 1 is the fastest, 2 is the default fast, higher numbers are slower
defaults write -g KeyRepeat -int 1

# InitialKeyRepeat:
# 10 is the fastest, higher numbers are slower
defaults write -g InitialKeyRepeat -int 10

# Apply the changes
killall SystemUIServer

echo "Keyboard repeat rate and initial key repeat delay have been set to the fastest settings."
