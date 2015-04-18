#!/bin/bash
set -e
source /tmp/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install curl wget nano vim psmisc mc iptraf bash-completion tcpdump mtr-tiny screen tmux rar unrar zip unzip lsof git mercurial strace ntp telnet nmap bind9-host dnsutils

## This tool runs a command as another user and sets $HOME.
cp /tmp/bin/setuser /sbin/setuser
## This is sudo replacement with better option https://github.com/tianon/gosu/releases/tag/1.3
curl -o /bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$(dpkg --print-architecture)"
chmod +x /bin/gosu
# Setup our oun tool for simple java setup
mkdir /java
ln -s /java /usr/java
wget https://roboreader:RoboPass2000@bitbucket.org/merchantry/infrastructure/raw/master/jbox/get_tools.sh -qO /usr/bin/get_tools.sh
chmod +x /usr/bin/get_tools.sh

