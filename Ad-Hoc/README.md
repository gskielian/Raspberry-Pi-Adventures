This will contain configurations for setting up a raspberry pi and wireless card for communication via WIFI.


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
