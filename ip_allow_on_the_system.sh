#!/bin/bash
echo "Please fill the IP and NAME fields:"
read -e - p "IP : " IP
echo "NAME"
read -e -p "NAME : " NAME
#----------------------------------------
export DATA="whostmgrd : $IP : allow\\
# $NAME\\
whostmgrd : ALL : deny\\
sshd : $IP : allow\\
# $NAME"
sed -i "s/whostmgrd : ALL : deny/${DATA}/g" /etc/hosts.allow
echo "$IP # $NAME" >> /etc/csf/csf.allow
