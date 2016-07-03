#!/usr/bin/perl

use warnings;
use strict;

if (system('rsync -a --rsh=ssh --delete --exclude=.dotfiles/config/pulse --exclude=.dotfiles/vim/bundle --exclude=.dotfiles/config/google-* --exclude=.dotfiles/config/libreoffice --exclude=.dotfiles/config/pianobar ~/.dotfiles ~/.ssh ~/.local/share/mc ~/.gtkrc-2.0 /usr/local/bin srsantos@131.204.120.103:~/shockwave_config') == 0) {
		(system('/usr/bin/notify-send -u low "Config backup complete."'));
		exit;
}	

else {
		(system('/usr/bin/notify-send -u critical "Backup failed!!!"'));
		exit
}
