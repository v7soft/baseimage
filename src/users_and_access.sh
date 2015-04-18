#!/bin/bash
set -e
source /tmp/buildconfig
set -x

groupadd -g 1100 appgroup 
useradd -g 1100 -u 1100 -s /bin/bash -d /app app
cp -rp /etc/skel /app
mkdir /app/.ssh
echo "GSSAPIAuthentication no
TCPKeepAlive yes
ServerAliveInterval 60
HashKnownHosts no
Compression yes
CompressionLevel 9
Cipher blowfish
StrictHostKeyChecking no
UserKnownHostsFile /dev/null" > /app/.ssh/config
export PS1=`echo -e '\[\033[01;37m\]\u\[\033[1;31m\]@\[\033[1;33m\]\h\[\033[00m\]:\[\033[1;32m\]\w\[\033[1;31m\]\\$\[\033[00m\] '`
wget https://raw.githubusercontent.com/mkostrikin/mysettings/master/docker_alias.sh -qP /etc/profile.d/
wget https://raw.githubusercontent.com/mkostrikin/mysettings/master/bashps1.sh -qP /etc/profile.d/
wget https://raw.githubusercontent.com/mkostrikin/mysettings/master/sqlplus.sh -qP /etc/profile.d/
wget https://raw.githubusercontent.com/mkostrikin/mysettings/master/.screenrc -qP /app/
chown -R app:appgroup /app

