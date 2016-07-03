
#!/bin/bash

LOCTEMP="`cliweather | grep -E '(Location|Temperature)' | awk -F":" '{print $2}' | sed 's/^ //;s/F\//°F\//;s/C$/°C/;/C$/!s/$/ -/;' | xargs`"

COND="`cliweather -f | grep Condition | awk -F":" '{print $2}' | head -1`"

if ! [ "`ping -c 1 google.com`" ]; then
    echo ": N/A"
else
    echo ": ${LOCTEMP} -${COND}"
fi
exit
