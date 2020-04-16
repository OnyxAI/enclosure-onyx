#!/bin/bash

##########################################################################
# udpate.sh
##########################################################################

cd ~
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/.bashrc
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/README
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/auto_run.sh
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/configure_wifi.sh
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/messagebus_emit.py
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/update-onyx.sh
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/should-update.sh

cd ~/bin
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/bin/view_log
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/bin/start
wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/bin/onyx
chmod +x *


cd ~
