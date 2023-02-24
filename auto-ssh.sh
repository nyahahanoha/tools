#!/usr/bin/env bash

path=$HOME/.ssh

if [ "$#" = 0 ]
then
	echo 'Usage:ssh-auto.sh host'
	exit
fi

if [ -e $path/id_rsa ]
then
	echo "Move id_rsa"
	exit
fi

if [ -e $path/id_rsa.pub ]
then
	echo "Move id_rsa.pub"
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

auto-keygen.sh
mkdir $path/$1
mv $path/id_rsa{,.pub} $path/$1/

echo -n "hostname(default: $1.com): "
read hostname
if [ "$hostname" == "" ]
then
	hostname=$1.com
fi
echo -n "user: "
read user

echo "
Host $1
	Hostname $hostname
	IdentityFile $path/$1/id_rsa
	User $user" >> $path/config
