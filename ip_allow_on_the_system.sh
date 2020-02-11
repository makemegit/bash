#!/bin/bash
echo "Please fill the IP and NAME fields:"
echo "IP:"
read -e - p IP
echo "NAME"
read NAME
#----------------------------------------
export DATA="whostmgrd : $IP : allow\\
# $NAME\\
whostmgrd : ALL : deny\\
sshd : $IP : allow\\
# $NAME"
sed -i "s/whostmgrd : ALL : deny/${DATA}/g" /etc/hosts.allow
echo "$IP # $NAME" >> /etc/csf/csf.allow
