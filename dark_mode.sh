# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    dark_mode.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/19 16:34:42 by wabolles          #+#    #+#              #
#    Updated: 2024/08/19 16:34:42 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

osascript <<EOF
tell application "System Events"
    tell appearance preferences
        set dark mode to true
    end tell
end tell
EOF
