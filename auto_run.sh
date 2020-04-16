#!/bin/bash
##########################################################################
# auto_run.sh
##########################################################################
# This script is executed by the .bashrc every time someone logs in to the
# system.

######################
# Comamnd line helpers
export PATH="$HOME/bin:$PATH"

echo ""
echo "***********************************************************************"
echo "** Onyx  image, ver" $(<version)
echo "***********************************************************************"

if [ "$SSH_CLIENT" == "" ]
then
   # running at the local console (e.g. plugged into the HDMI output)

   # Make sure the audio is being output via the correct device.  You can
   # change this to match your usage in audio_setup.sh, the default is
   # to output from the headphone jack.
   #
   sudo amixer cset numid=3 "1"   # audio out the analog speaker/headphone jack
   amixer set Master 75% # set volume to a reasonable level

   # Do not edit this script (it may be replaced later by the update process),
   # but you can edit and customize the audio_setup.sh and custom_setup.sh
   # script.  Use the audio_setup.sh to change audio output configuration and
   # default volume; use custom_setup.sh to initialize any other IoT devices.
   #
   # Check for custom audio setup
   if [ -f audio_setup.sh ]
   then
      source audio_setup.sh
   fi

   # Check for custom Device setup
   if [ -f custom_setup.sh ]
   then
      source custom_setup.sh
   fi

   # Upgrade if connected to the internet and one is available
   ping -q -c 1 -W 1 google.com >/dev/null 2>&1
   if [ $? -eq 0 ]
   then
      echo "Checking for updates to Onyx environment"
      cd /tmp
      wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/version
      if [ $? -eq 0 ]
      then
         if [ ! -f ~/version ]
         then
            echo "unknown" > ~/version
         fi

         cmp /tmp/version ~/version
         if  [ $? -eq 1 ]
         then
            # Versions don't match...update needed
            echo "Updating Onyx scripts!"
            wget -N https://raw.githubusercontent.com/OnyxAI/enclosure-onyx/master/update.sh
            source update.sh
            cp /tmp/version ~/version

            # restart
            echo "Rebooting now"
            sudo reboot now
         fi
      fi

   fi

   sudo onyx start
   sleep 2

   # check to see if the unit is connected to the internet.
   if ! ping -q -c 1 -W 1 google.com >/dev/null 2>&1
   then
      echo "Internet connection not detected, starting WIFI setup process..."
      sudo service nginx stop
      sudo bash configure_wifi.sh &
      # Wait for an internet connection -- either the user finished Wifi Setup or
      # plugged in a network cable.
      while ! ping -q -c 1 -W 1 8.8.8.8 >/dev/null 2>&1 ; do
         sleep 1
      done

      echo "Internet connection detected!"
      echo "Restarting..."
      sudo reboot now
   fi

else
   # running from a SSH session
   echo "Remote session"
fi


sleep 2
echo ""
echo "***********************************************************************"
echo "In a few moments you will see the contents of the log.  Hit"
echo "Ctrl+C to stop showing the log and return to the command line.  You will"
echo "still be able to speak to Onyx after that, only the display of the"
echo "log will cease.  To see the live log again, type:"
echo "    view_log"
echo ""
echo "***********************************************************************"
echo ""
echo ""
sleep 2

view_log web &
