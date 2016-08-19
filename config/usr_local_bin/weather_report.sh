
#!/bin/bash

LOCWEATHER="`wunderground.py | grep -E '(Location|Condition|Temperature)' | sed 's/Location : //;s/Condition : /: /;s/Temperature ://;s/ C)/ °C)/;s/ F / °F /' | xargs`"

if ! [ "`ping -c 1 google.com`" ]; then
    echo ": N/A"
else
    echo ": ${LOCWEATHER}"
fi
exit
