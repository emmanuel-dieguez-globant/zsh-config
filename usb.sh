#!/bin/bash - 
#===============================================================================
#
#          FILE: usb.sh
# 
#         USAGE: ./usb.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 28/09/15 09:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

dmesg | tail -n15

