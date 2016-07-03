#!/usr/bin/env bash
[[ "$1" == "up" ]] && amixer set Master 5%+
[[ "$1" == "down" ]] && amixer set Master 5%-
[[ "$1" == "mute" ]] && amixer sset Master toggle

FRONT_LEFT=$(amixer get Master | grep -E '^\s+Front Left')
echo $FRONT_LEFT | grep -q off

MUTED=$?
if [[ $MUTED == 0 ]]; then
volnoti-show -m
else
VOL=$(echo $FRONT_LEFT | grep -o -P '\d+%')
volnoti-show $VOL
fi
exit 0
