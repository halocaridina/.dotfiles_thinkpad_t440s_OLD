#!/usr/bin/env bash
# This script will toggle the functionality of the Synaptics touchpad

declare -i ID
ID=`/usr/bin/xinput list | /usr/bin/grep -Eio 'touchpad\s*id\=[0-9]{1,2}' | /usr/bin/grep -Eo '[0-9]{1,2}'`
declare -i STATE
STATE=`/usr/bin/xinput list-props $ID | /usr/bin/grep 'Device Enabled' | /usr/bin/awk '{print $4}'`

if [ $STATE -eq 0 ]
then
    /usr/bin/rm -f /tmp/touchpad_toggled.*
    /usr/bin/xinput enable $ID
    /usr/bin/volnoti-show -m -n -s /usr/share/pixmaps/volnoti-media/touchpad_icon.svg && sleep 3 &
else
    /usr/bin/rm -f /tmp/touchpad_toggled.*
    /usr/bin/xinput enable $ID
    /usr/bin/touch /tmp/touchpad_toggled.pid && /usr/bin/echo "1" > /tmp/touchpad_toggled.lock
    /usr/bin/chown srsantos:users /tmp/touchpad_toggled.*
    /usr/bin/xinput disable $ID
    /usr/bin/volnoti-show -m -n -s /usr/share/pixmaps/volnoti-media/touchpad_disable_icon.svg && sleep 3 &
fi
