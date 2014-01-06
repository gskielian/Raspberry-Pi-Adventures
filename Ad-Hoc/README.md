Setting Up an Ad-Hoc Network
============================

Suppose you would like to set up the raspberry pi to communicate to another device via wireless -- directly (wifi to wifi direct connection without routers or anything).

This is this meaning of hte __Ad-Hoc__ Network.

You can surprisingly accomplish this task in less than 10 minutes. 

### Step 1: configuring your interfaces


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

### Step 2: Reset your wifi settings

Then write quit and reset your wifi settings with the following two commands:

``` bash
sudo ifdown wlan0
sudo ifup wlan0
```

(Alternatively you could reset your raspberry pi with `sudo shutdown -r now`, but then you would need to wait)


### Workarounds and drivers

If you have the RTL8192cu Chipset, like this awesome one from adafruit:

<a href="http://www.adafruit.com/products/1030#Technical_Details"> <img src="http://www.adafruit.com/images/large/1030_LRG.jpg" width="300px" alt="adafruit's awesome wifi with antennae for more range"> </a>

Then you will need to download a driver from the following website:

http://www.electrictea.co.uk/rpi/8192cu.tar.gz
