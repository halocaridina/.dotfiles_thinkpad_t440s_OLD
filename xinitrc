#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Start Gnome keyring
#eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcsll,secrets,ssh)
#export GPG_AGENT_INFO SSH_AUTH_SOCK

# Merging .Xresources
# See https://wiki.archlinux.org/index.php/X_resources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

# Start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
export SSH_AUTH_SOCK

# Start WM of choice by adding options similar to below
case $WM in
i3)
	/usr/bin/i3
	;;
#i3-bones)
#	/usr/bin/i3 -c /home/srsantos/.i3/bones.conf
#	;;
#i3-debug)
#	/usr/bin/i3 -c /home/srsantos/.i3/bling.conf -V >> /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1
#	;;
#herb)
#	/usr/bin/herbstluftwm --locked
#	;;
*)
	/usr/bin/i3
	;;
esac

