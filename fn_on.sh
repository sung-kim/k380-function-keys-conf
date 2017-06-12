#!/bin/sh


TOOL="$(dirname $0)/k380_conf"
DEV="$(ls /sys/class/hidraw/ -l | grep 046D:B342 | grep -o 'hidraw[0-9]*$')"


if test -n "$DEV" 
then
    echo "Found K380 at $DEV"
    $TOOL -d "/dev/$DEV" -f on
fi


