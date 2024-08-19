# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    zshrc                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wabolles <wabolles@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/19 16:34:46 by wabolles          #+#    #+#              #
#    Updated: 2024/08/19 16:41:55 by wabolles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

alias c=clear
alias m=make
alias mc="make clean"
alias mf="make fclean"
alias mr="make re"
alias n=norminette
alias code='open -a "Visual Studio Code"'
alias cclean='bash ~/Cleaner_42.sh'
alias add="git add ."
alias gc="git commit -m "no_need_to_write_a_commit""
alias sethaha='
git config --global user.name "TheF" &&
git config --global user.email "wassimbolles18@gmail.com" &&
git config user.name "TheF" &&
git config user.email "wassimbolles18@gmail.com" &&
echo "Git global and local user name and email have been set!"
'

alias s="$sethaha && $add && $gc && $gp"


FILE_PATH="/Users/wabolles/thef_scripts/file"
alias zero='echo "0" > "$FILE_PATH"'

# thef scripts
# bash /Users/wabolles/thef_scripts/pop_up.sh

var=$(cat "$FILE_PATH")

if [ $var -eq 0 ]
then	bash /Users/wabolles/thef_scripts/thef.sh
		var=$((var + 1)) 
		echo "$var" > "$FILE_PATH"
else 	echo "you are in the dark mode"

fi
