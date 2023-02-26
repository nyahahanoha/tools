#!/usr/bin/env bash

path=$HOME/.ssh

if [ $# -lt 2 ]
then
	echo 'Usage:ssh-auto.sh host user (hostname)'
	exit
fi

if [ -d $path/$1 ]
then
	echo "File already exists"
	exit
fi

while read line
do
	if [ "$line" == "Host $1" ]
	then
		echo $line
		echo "This host already exists"
		exit
	fi
done < $path/config

mkdir $path/$1
auto-keygen.sh $1

echo "
Host $1
	Hostname ${3:-$1.com}
	IdentityFile $path/$1/id_rsa
	User $2" >> $path/config
