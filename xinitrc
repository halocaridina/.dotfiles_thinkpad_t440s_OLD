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

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
