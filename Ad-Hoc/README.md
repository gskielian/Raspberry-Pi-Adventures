Setting Up an Ad-Hoc Network
============================

Suppose you would like to set up the raspberry pi to communicate to another device via wireless -- directly (wifi to wifi direct connection without routers or anything).

This is this meaning of hte __Ad-Hoc__ Network.

You can surprisingly accomplish this task in less than 10 minutes. 

Steps:
------


first vim into /etc/network/interfaces 

and type in the following 


``` bash
auto lo
iface lo inet loopback
iface eth0 inet dhcp

auto wlan0
iface wlan0 inet static
  address 192.168.1.1
  netmask 255.255.255.0
  wireless-channel 1
  wireless-essid AwesomeAdhocNetwork
  wireless-mode ad-hoc
```

Then write quit and reset your wifi settings with the following two commands:

``` bash
sudo ifdown wlan0
sudo ifup wlan0
```
