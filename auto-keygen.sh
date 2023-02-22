#!/usr/bin/expect -f

set timeout 3
spawn ssh-keygen -t rsa
expect Enter
send \n
expect Enter
send \n
expect Enter
send \n
interact
