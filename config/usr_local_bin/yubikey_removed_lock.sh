#!/usr/bin/env bash

export DISPLAY=:0

/usr/bin/xset dpms force off

##Put your script to lock the screen in /usr/local/bin/lock. You must set DISPLAY=:0 to have the screen locker work correctly if you're not using a daemonized locker such as xscreensaver or gnome-screensaver

#!/bin/bash
# Double checking if the Yubikey is actually removed, Challenge-Response won't trigger the screensaver this way.
#USERNAME="joost"
#result=$(lsusb | grep -e "Yubikey")

#if [ $? -ne 0 ]; then
#        logger "YubiKey Removed or Changed"
        # Running the Cinnamon screensaver lock command
#        /bin/su $USERNAME -c "DISPLAY=:0 /usr/bin/cinnamon-screensaver-command --lock"
#else
        # Running the Cinnamon screensaver unlock command
#        logger "YubiKey Found, Unlocking screensaver if found"
#        /bin/su $USERNAME -c "DISPLAY=:0 /usr/bin/cinnamon-screensaver-command -d"
#fi

