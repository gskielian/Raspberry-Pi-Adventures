#!/bin/bash


echo "running updates"
sudo apt-get update
sudo apt-get upgrade

echo "installing pip and dev packages"
sudo apt-get install python-pip python2.7-dev

sudo easy_install -U distribute

echo "now. installing. tornado."
sudo pip install tornado


echo "installing arduino"
sudo apt-get install arduino
sudo usermod -a -G tty pi
sudo usermod -a -G dialout pi

echo "installing GPIO"
sudo pip install RPi.GPIO

echo "installing pyserial"
sudo apt-get install python-serial python3-serial


##letting Tornado fly

python server.py
