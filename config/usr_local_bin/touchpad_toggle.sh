#!/bin/bash
#
# This script will toggle the functionality of your Synaptics touchpad,
# restarting syndaemon as needed, and send a desktop notification event
# for some visual feedback. It is even more useful when run via a custom
# keyboard binding.
idle_time=1.5 # seconds
killall syndaemon
state=`synclient -l | grep TouchpadOff | sed 's/^.*= //'`
if [ $state -eq 1 ]
then
/usr/bin/volnoti-show -m -n -s /usr/share/pixmaps/volnoti-media/touchpad_icon.svg
/usr/bin/synclient TouchpadOff=0
/usr/bin/syndaemon -i $idle_time -d
else
/usr/bin/volnoti-show -m -n -s /usr/share/pixmaps/volnoti-media/touchpad_disable_icon.svg
/usr/bin/synclient TouchpadOff=1
fi