#!/bin/bash

led="/sys/devices/platform/thinkpad_acpi/leds/tpacpi::micmute/brightness"
if [[ $(amixer sget Capture) == *"[on]"* ]]; then
  amixer sset Capture nocap
  [[ -f $led ]] && echo 1 > $led
   /usr/bin/volnoti-show -m -n -s /usr/share/pixmaps/volnoti-media/microphone-sensitivity-none-symbolic.svg
else
  amixer sset Capture cap
  [[ -f $led ]] && echo 0 > $led#
  /usr/bin/volnoti-show -m -n -s /usr/share/pixmaps/volnoti-media/microphone-sensitivity-high-symbolic.svg
fi
