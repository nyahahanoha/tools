#!/usr/bin/env bash

expect -c "
set timeout 3
spawn ssh-keygen -t rsa
expect \"Enter\"
send \"$HOME/.ssh/${1:-.}/id_rsa\n\"
expect \"Enter\"
send \"\n\"
expect \"Enter\"
send \"\n\"
interact
"
