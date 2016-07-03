#!/bin/bash

UPDATES="`pacaur -k | awk '{print $3}' | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"`"
NUM_UPDATES="`pacaur -k | awk '{print $3}' | wc -l`"

if ! [ "`ping -c 1 google.com`" ]; then
    notify-send -u critical "Currently offline." "Will check for AUR updates again in 2 hrs."
elif [ "$NUM_UPDATES" == 0 ]; then
    notify-send -u low -i /usr/share/icons/Adwaita/48x48/apps/system-software-update.png 'No updates from AUR.'
else
    notify-send -u critical -i /usr/share/icons/Adwaita/48x48/apps/system-software-update.png 'Available updates from AUR:' "${UPDATES}"
fi
exit
