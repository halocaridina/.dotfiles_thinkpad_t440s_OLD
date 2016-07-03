
#!/bin/bash

LOCWEATHER="`weather-report 36830 | grep -E '(Current|Temperature|Sky)' | sed 's/^   //;s/Current conditions at//;s/Temperature:/-/;s/Sky conditions:/-/' | xargs`"

if ! [ "`ping -c 1 google.com`" ]; then
    echo ": N/A"
else
    echo ": ${LOCWEATHER}"
fi
exit
