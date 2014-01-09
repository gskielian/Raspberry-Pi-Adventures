#!/bin/bash

sudo apt-get install bridge-utils hostapd

#wget http://www.daveconroy.com/wp3/wp-content/uploads/2013/07/hostapd.zip


echo "checkpoint 1"
read command

unzip hostapd.zip


echo "checkpoint 2"
read command

sudo mv /usr/sbin/hostapd /usr/sbin/hostapd.bak
sudo ln -sf /usr/sbin/hostapd.edimax /usr/sbin/hostapd
sudo chown root.root /usr/sbin/hostapd
sudo chmod 755 /usr/sbin/hostapd

echo "checkpoint 3"
read command

sudo mv /etc/network/interfaces /etc/network/interfaces.bak
sudo sh -c "cat etc.network.interfaces > /etc/network/interfaces"

echo "checkpoint 4"
read command

sudo reboot
