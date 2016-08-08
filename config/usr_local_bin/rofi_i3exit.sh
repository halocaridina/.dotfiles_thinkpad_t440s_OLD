#!/bin/bash

res=$(rofi -color-enabled "true" -color-window "#222222,#396EB4" -color-urgent "#222222,#EF2929,#222222,#396EB4,#FFFFFF" -color-normal "#222222,#FFFFFF,#222222,#396EB4,#FFFFFF" -dmenu -lines 5 -p "What do you want to do? " -i -u 2-4 < ~/.config/i3/rofi-i3exit.opts)

if [[ $res = "LOCK SCREEN" ]]; then
    xset dpms force off
fi
if [[ $res = "SUSPEND TO RAM" ]]; then
    systemctl suspend
fi
if [[ $res = "LOGOUT TO TTY" ]]; then
    pkill -f xss-lock && pkill -f nm-applet && pkill -f parcellite && pkill -f pasystray && i3-msg exit
fi
if [[ $res = "REBOOT" ]]; then
    systemctl reboot
fi
if [[ $res = "SHUTDOWN" ]]; then
    systemctl poweroff
fi
exit 0
