#!/bin/bash

/usr/bin/pkill -f nm-applet >/dev/null 2>&1

/usr/bin/pkill -f parcellite >/dev/null 2>&1

#/usr/bin/pkill -f caffeine >/dev/null 2>&1

/usr/bin/pkill -f pasystray >/dev/null 2>&1

/usr/bin/pkill -f conky >/dev/null 2>&1

/usr/bin/i3-msg restart >/dev/null 2>&1

/usr/bin/pasystray &

#/usr/bin/caffeine &

/usr/bin/parcellite &

/usr/bin/nm-applet &

/usr/bin/conky -c /home/srsantos/.config/conky/bar_conkyrc >/dev/null 2>&1 &

