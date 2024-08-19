# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    keyboard_speed.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/19 18:10:45 by wabolles          #+#    #+#              #
#    Updated: 2024/08/19 18:17:28 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

defaults write -g KeyRepeat -int 10
defaults write -g InitialKeyRepeat -int 100
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
