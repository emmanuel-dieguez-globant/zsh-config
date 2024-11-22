#! /bin/bash
if [ $# -ge 1 ]; then
    timeout=$1
else
    timeout=10
fi

while true; do
    xset dpms force off
    sleep $timeout
done
