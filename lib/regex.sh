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

 F_BLACK=30;  F_RED=31;   F_GREEN=32;  F_YELLOW=33; F_BLUE=34;
F_PURPLE=35;  F_CYAN=36;  F_GRAY=37;   F_WHITE=38;

# Background Colors ------------------------------------------------------------
 B_BLACK=40;  B_RED=41;   B_GREEN=42;  B_YELLOW=43; B_BLUE=44;
B_PURPLE=45;  B_CYAN=46;  B_GRAY=47;

# Formats ----------------------------------------------------------------------
BOLD=01;  ITALIC=03  UNDER=04;  BLINK=05;  REVERSE=07;

cout() {
    format=$1; shift
    echo -en "[${format}m""$*""[0m"
}

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
