#!/usr/bin/env bash

res=$(rofi -dmenu -lines 5 -columns 2 -u 2-4 -p "What do you want to do? " -input < ~/.config/i3/rofi-i3exit.opts)

if [[ $res = "LOCK SCREEN" ]]; then
    xset dpms force off
fi
if [[ $res = "LOGOUT TO TTY" ]]; then
    pkill -f xss-lock && pkill -f compton && pkill -f nm-applet && pkill -f parcellite && pkill -f pasystray && i3-msg exit
fi
if [[ $res = "SUSPEND TO RAM" ]]; then
    systemctl suspend
fi
if [[ $res = "REBOOT" ]]; then
    systemctl reboot
fi
if [[ $res = "SHUTDOWN" ]]; then
    systemctl poweroff
fi
exit 0

