#!/bin/bash

FAN="`sensors | grep fan | awk '{print $2, $3}'`"

echo ": ${FAN}"
exit 0
