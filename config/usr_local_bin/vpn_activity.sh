#!/bin/bash

VPN0="/var/run/NetworkManager/nm-vpnc-b36460e8-359e-4892-94ac-6cb959a3156f.pid"

if [ -f "$VPN0" ]
	then
		echo ""
        exit 0
fi
