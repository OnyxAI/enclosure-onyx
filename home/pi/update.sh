#!/bin/bash

##########################################################################
# udpate.sh
##########################################################################

cd ~
wget -N https://raw.githubusercontent.com/OnyxProject/enclosure-onyx/master/home/pi/.bashrc
wget -N https://raw.githubusercontent.com/OnyxProject/enclosure-onyx/master/home/pi/README
wget -N https://raw.githubusercontent.com/OnyxProject/enclosure-onyx/master/home/pi/auto_run.sh
wget -N https://raw.githubusercontent.com/OnyxProject/enclosure-onyx/master/home/pi/configure_wifi.sh
wget -N https://raw.githubusercontent.com/OnyxProject/enclosure-onyx/master/home/pi/messagebus_emit.py
wget -N https://raw.githubusercontent.com/OnyxProject/enclosure-onyx/master/home/pi/say_command.py

cd ~/bin
wget -N https://raw.githubusercontent.com/OnyxProject/enclosure-onyx/master/home/pi/bin/view_log
chmod +x *

# Cleanup post-upgrade
if [ -f say ]
then
   rm say
fi

cd ~
