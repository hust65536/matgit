#!/bin/bash

sudo ./connect.sh test_5

if [ ! -n "$1" ] 
then
    echo "Lack name of csi data!" 
    exit
fi

echo "Start to log and ping..."
sudo /home/lgy/linux-80211n-csitool-supplementary/netlink/log_to_file /home/lgy/csi/$1.dat & gnome-terminal -t "ping terminal" -x bash -c "ping -i 0.01 -c 100 192.168.1.1;exec bash"

sleep 10
echo "Change to connect another AP..."
sudo ./connect.sh test_24








exit







