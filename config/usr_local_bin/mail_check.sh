#!/bin/bash

MAIL="`/home/srsantos/.config/i3/i3pystatus/imap_mail.pl`"

if [ "$MAIL" == 0 ]
	then
		echo ": 0"
        exit 0
	else
		echo ": ${MAIL}"
        exit 1
fi
