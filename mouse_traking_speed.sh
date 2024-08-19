# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mouse_traking_speed.sh                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/19 16:34:30 by wabolles          #+#    #+#              #
#    Updated: 2024/08/19 17:42:56 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MOUSE_SPEED_FILE="$HOME/.mouse_speed"
INCREMENT=10.5

if [ -f "$MOUSE_SPEED_FILE" ]; then
    CURRENT_SPEED=$(cat "$MOUSE_SPEED_FILE")
else
    CURRENT_SPEED=1.0
fi

echo "Current speed: $CURRENT_SPEED"
NEW_SPEED=$(echo "$CURRENT_SPEED + $INCREMENT" | bc)
echo "New speed: $NEW_SPEED"

defaults write -g com.apple.mouse.scaling -float "$NEW_SPEED"
echo "Mouse speed set to $NEW_SPEED"
echo "$NEW_SPEED" > "$MOUSE_SPEED_FILE"

killall SystemUIServer
killall Dock
