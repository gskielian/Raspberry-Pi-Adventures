#!/bin/bash

### INSTALL IMPORTANT SOFTWARE

sudo apt-get install git # svn is important
sudo apt-get install vim # vim is important
sudo apt-get install figlet # style is important

sudo apt-get install hostapd isc-dhcp-server

### Copying DHCP config files

sudo sh -c "cat ./dhcpd.conf > /etc/dhcp/dhcpd.conf"

sudo sh -c "cat isc-dhcp-server > /etc/default/isc-dhcp-server"


### SETTING UP THE INTERFACES

sudo ifdown wlan0

sudo sh -c "cat interfaces > /etc/network/interfaces"
sudo sh -c "cat hostapd.conf > /etc/hostapd/hostapd.conf"
sudo sh -c "cat hostapd > /etc/default/hostapd"


### CONFIGURE NETWORK ADDRESS TRANSLATION


sudo sh -c "cat sysctl.conf > /etc/sysctl.conf"
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

### iptables code
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT


sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"


sudo mv /usr/sbin/hostapd /usr/sbin/hostapd.ORIG
sudo cp adafruit_hostapd usr/sbin/hostapd
sudo chmod 755 /usr/sbin/hostapd


sudo hostapd ./hostapd.conf

sudo ifup wlan0 #if this line isn't here, it erroneously expects WEP instead of WPA2

chmod +x initSoftAP
./initSoftAP wlan0

#mad credits to http://nims11.wordpress.com/2012/04/27/hostapd-the-linux-way-to-create-virtual-wifi-access-point/ for that last bit with initSoftAP

