#!/bin/bash
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install figlet

sudo apt-get install hostapd isc-dhcp-server

sudo sh -c "cat ./dhcpd.conf > /etc/dhcp/dhcpd.conf"

sudo sh -c "cat isc-dhcp-server > /etc/default/isc-dhcp-server"

sudo ifdown wlan0


