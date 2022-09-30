#! /usr/bin/env bash

# Simple script to turn on/off bluetooth
# returns:
#   0 - bluetooth turned off
#   1 - bluetooth turned on
#   2 - unexpected status

set -e

bt_status=$(rfkill | grep bluetooth | awk '{print $4}')

if [ $bt_status = 'blocked' ] || [ $bt_status = 'unblocked' ]; then
    if [ $bt_status == 'blocked' ]; then
        rfkill unblock bluetooth
    else
        rfkill block bluetooth
        exit 0
    fi
fi

exit 1
