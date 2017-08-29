#!/bin/bash
TOP="/home/pi/Onyx"

source ${TOP}/venv/bin/activate
PYTHONPATH=${TOP} ${TOP}/venv/bin/python messagebus_emit.py onyx.wifi.start &

echo "====================================================================="
echo "Wifi setup has begun.  Use your phone, tablet or laptop to connect to"
echo "the network 'ONYX' using the password 'ONYXLABS'.  Once connected"
echo "browse to 'https://start.onyx.ai', then follow the prompts to"
echo "complete the setup."
echo "====================================================================="
