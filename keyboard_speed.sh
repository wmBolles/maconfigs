#!/bin/bash

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
killall SystemUIServer
killall cfprefsd
dscacheutil -flushcache

echo "Keyboard repeat rate and initial key repeat delay have been set to the fastest settings."
echo "Current KeyRepeat setting:"
defaults read -g KeyRepeat

echo "Current InitialKeyRepeat setting:"
defaults read -g InitialKeyRepeat

ioreg -r -c AppleHIDKeyboardEventDriver | grep -i "KeyRepeat"
killall cfprefsd
dscacheutil -flushcache
