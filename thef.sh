# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    thef.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/19 16:34:39 by wabolles          #+#    #+#              #
#    Updated: 2024/08/25 14:06:47 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

bash ./utils/dark_mode.sh
#bash ~/maconfigs/mouse_traking_speed.sh
#bash ~/maconfigs/keyboard_speed.sh

# Keyboard repeat rate (lower is faster)
# defaults write -g KeyRepeat -int 1
# # Initial key repeat delay (lower is shorter)
# defaults write -g InitialKeyRepeat -int 15

# # Restart SystemUIServer and Dock to apply the new settings
# killall SystemUIServer
# killall Dock

#3. Change the display color profile to Rec. ITU-R BT.709-5
osascript <<EOF
tell application "System Preferences"
    reveal anchor "displaysDisplayTab" of pane id "com.apple.preference.displays"
end tell

tell application "System Events"
    tell process "System Preferences"
        delay 1
        click button "Color" of tab group 1 of window 1
        delay 1
        select (row 1 of table 1 of scroll area 1 of tab group 1 of window 1 whose value of text field 1 of UI element 1 of UI element 1 is "Rec. ITU-R BT.709-5")
    end tell
end tell

# tell application "System Preferences" to quit
# EOF

# echo "Script completed. Please log out and log back in to apply all changes."
