#!/bin/bash
set -e
source /tmp/buildconfig
set -x

cp -rp /tmp/config/consul /etc/
wget -q https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_linux_amd64.zip -O /tmp/consul.zip
cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip
mkdir /etc/service/consul
cp /tmp/runit/consul /etc/service/consul/run

