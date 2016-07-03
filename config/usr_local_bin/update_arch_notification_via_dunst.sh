#!/bin/bash

UPDATES="`/usr/bin/checkupdates`"
NUM_UPDATES="`/usr/bin/checkupdates | wc -l`"

if ! [ "`ping -c 1 google.com`" ]; then
    notify-send -u critical "Currently offline." "Will check for Archlinux updates again in 2 hrs."
elif [ "$NUM_UPDATES" == 0 ]; then
    notify-send -u low -i /usr/share/icons/Adwaita/48x48/apps/system-software-update.png 'No updates for Archlinux.'
else
    notify-send -u critical -i /usr/share/icons/Adwaita/48x48/apps/system-software-update.png 'Available updates to Archlinux:' "${UPDATES}"
fi
exit
