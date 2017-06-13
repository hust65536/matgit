#!/bin/bash

if [ ! -n "$1" ] 
then
    echo "Lack ssid of the router!" 
    exit
fi



sudo modprobe -r iwlwifi mac80211
echo "Unload the driver..."
sleep 1

sudo modprobe iwlwifi connector_log=0x1
echo "Reload the driver..."
sleep 1

sudo ip link set wlan0 up
sudo iw dev wlan0 connect $1
sudo dhclient wlan0
sleep 3



echo "Connect to $1!"


