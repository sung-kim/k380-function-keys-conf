#!/bin/sh

# Logitech
VENDOR_ID=046D
# K380
DEV_ID=B362    # newer keyboards
#DEV_ID=B342   # older revision, probably

# Get the hidraw file handle, if it matches the fields above
DEV="$(ls /sys/class/hidraw/ -l | grep "$VENDOR_ID:$DEV_ID" | grep -o 'hidraw[0-9]*$')"
TOOL="$(dirname $0)/k380_conf"

# Run if parameter $1 is nothing or it is k380 keyboard
if test -n "$DEV" && (test -z "$1" || test "/dev/$DEV" = "$1")
then
    echo "Found K380 at $DEV"
    $TOOL -d "/dev/$DEV" -f on
fi
