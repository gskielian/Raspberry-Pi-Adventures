Notes for setting up Bluetooth
==============================


| GPIO pin |BT Pin |
| :---     |   ---:| 
| 2 (5v)	 |   VCC |
| 6 (GND)  |	 GND |
| 8 (TXD)  |	 RXD |
| 10 (RXD) |   TXD | 



Change hte 115200 to 9600 in `/boot/cmdline.txt`, the final file should look like this:

```sh
dwc_otg.lpm_enable=0 console=ttyAMA0,9600 kgdboc=ttyAMA0,9600 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait`
```

finally uncomment the following line in `/etc/inittab` and change it to look like this:

```sh
T0:23:respawn:/sbin/getty -L ttyAMA0 9600 vt100`
```


```sh
sudo apt-get install bluetooth
```
