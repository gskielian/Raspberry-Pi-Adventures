#!/bin/bash

sudo apt-get install bridge-utils hostapd

wget http://www.daveconroy.com/wp3/wp-content/uploads/2013/07/hostapd.zip


echo "if successful press y"
read command

if [ ! command = "y" ] ; then
  exit
fi

unzip hostapd.zip

sudo mv /usr/sbin/hostapd /usr/sbin/hostapd.bak
sudo ln -sf /usr/sbin/hostapd.edimax /usr/sbin/hostapd
sudo chown root.root /usr/sbin/hostapd
sudo chmod 755 /usr/sbin/hostapd

sudo mv /etc/network/interfaces/ /etc/network/interfaces.bak
sudo sh -c "cat etc.network.interfaces > /etc/network/interfaces"

sudo reboot
