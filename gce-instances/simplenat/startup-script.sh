#! /bin/bash
apt-get -y update
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -v -L -t nat
echo "net.ipv4.ip_forward=1" > /etc/sysctl.d/20-natgw.conf
apt-get install iptables-persistent