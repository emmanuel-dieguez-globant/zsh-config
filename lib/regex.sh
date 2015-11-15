#!/bin/bash -
#===============================================================================
#
#          FILE: regex.sh
#
#         USAGE: source regex.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: Funciones para trabajar con expresiones regulares
#        AUTHOR: Aeelinn
#  ORGANIZATION:
#       CREATED: 13/09/13 22:30:27 CDT
#      REVISION:  ---
#===============================================================================

init_regex() {
    cout "$BOLD;$F_GREEN" "    init_regex... "

    # Variables
    user_agent='Windows 9 Alpha'

    # Files
    smp_file="$(mktemp /tmp/smp.XXXXXXXXXX)"  # Sample file
    rgx_file="$(mktemp /tmp/rgx.XXXXXXXXXX)"  # Regex file
    swp_file="$(mktemp /tmp/swp.XXXXXXXXXX)"  # Swap file

    cout "$BOLD;$F_GREEN" "done\n"
}

set_HTTP_sample() {
    wget -qU "$user_agent" -O $smp_file $1
    restore_sample
}

set_RAW_sample() {
    echo "$*" > $smp_file
    restore_sample
}

set_FILE_sample() {
    cp "$1" $smp_file
    restore_sample
}

draw_regex() {
    egrep -io "$1" $rgx_file > $swp_file
    cp $swp_file $rgx_file
}

replace_regex() {
    sed s/"$1"/"$2"/g $rgx_file > $swp_file
    cp $swp_file $rgx_file
}

restore_sample() {
    cp $smp_file $rgx_file
}

update_sample() {
    cp $rgx_file $smp_file
}

show_sample() {
    cat $smp_file
}

show_regex() {
    cat $rgx_file
}
