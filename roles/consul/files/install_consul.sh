#!/bin/sh
sudo mkdir /etc/consul.d
sudo mkdir /var/lib/consul
cd /tmp
wget https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip
unzip consul_0.7.5_linux_amd64.zip
sudo mv consul /usr/bin

