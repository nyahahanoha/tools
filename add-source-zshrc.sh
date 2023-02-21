#!/usr/bin/env bash

if [ "$#" = 0 ]
then
	echo 'Usage:alias-source-tools.sh toolname'
	exit
fi

text="alias $1=\"source $1\""
while read line
do
	if [[ "$line" == "$text" ]]
    then
		exit
	fi
done < $HOME/.zshrc
echo $text >> $HOME/.zshrc
echo "Added source $1 to .zshrc file."
echo 'Restart the terminal'
