# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/19 18:07:10 by wabolles          #+#    #+#              #
#    Updated: 2024/08/19 18:07:10 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

ZSHRC_CONTENT=$(cat << 'EOF'
echo "Hey TheF 👋"

alias c='clear'
alias m='make'
alias mc='make clean'
alias mf='make fclean'
alias mr='make re'
alias n='norminette'
alias code='open -a "Visual Studio Code"'
alias cclean='bash ~/Cleaner_42.sh'
alias add='git add .'
alias gc='git commit -m "no_need_to_set_a_commit"'

sethaha() {
    git config --global user.name "TheF" &&
    git config --global user.email "wassimbolles18@gmail.com" &&
    git config user.name "TheF" &&
    git config user.email "wassimbolles18@gmail.com" &&
    echo "Git global and local user name and email have been set!"
}

s() {
    sethaha &&
    add &&
    gc &&
    git push
}

FILE_PATH="/Users/wabolles/thef_scripts/file"
alias zero='echo "0" > "$FILE_PATH"'

var=$(cat "$FILE_PATH")

if [ "$var" -eq 0 ]; then
    bash /Users/wabolles/thef_scripts/thef.sh
    var=$((var + 1))
    echo "$var" > "$FILE_PATH"
else
    echo "You Are In The Dark Mode Now!"
fi
EOF
)

if ! grep -q "Hey TheF 👋" ~/.zshrc; then
    echo "$ZSHRC_CONTENT" >> ~/.zshrc
    echo "Configuration has been added to ~/.zshrc."
else
    echo "Configuration already exists in ~/.zshrc."
fi
