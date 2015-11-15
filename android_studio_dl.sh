#!/bin/bash

# Font Colors ------------------------------------------------------------------
 F_BLACK=30;  F_RED=31;   F_GREEN=32;  F_YELLOW=33; F_BLUE=34;
F_PURPLE=35;  F_CYAN=36;  F_GRAY=37;   F_WHITE=38;

# Background Colors ------------------------------------------------------------
 B_BLACK=40;  B_RED=41;   B_GREEN=42;  B_YELLOW=43; B_BLUE=44;
B_PURPLE=45;  B_CYAN=46;  B_GRAY=47;

# Formats ----------------------------------------------------------------------
BOLD=01;  ITALIC=03  UNDER=04;  BLINK=05;  REVERSE=07;

cout() {
    format=$1; shift
    echo -en "["${format}"m""$*""[0m"
}

cout "$F_GREEN;$BOLD" "Loading functions... "

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
    wget -qU $user_agent -O $smp_file $1
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
    show_regex | sed s/"$1"/"$2"/g > $swp_file
    cp $swp_file $rgx_file
}

delete_new_lines() {
    cat $rgx_file | tr '\n' ' ' > $swp_file
    cp $swp_file $rgx_file
    replace_regex ' $'
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

cout "$F_GREEN;$BOLD" "done\n"

# Main function ================================================================
init_regex

cout "$F_GREEN;$BOLD" "Downloading Android Studio\n"

set_HTTP_sample 'https://developer.android.com/sdk/installing/studio.html'
draw_regex 'href="https://dl.google.com/dl/android/studio/[^"]+linux\.zip'
replace_regex 'href="'

wget -ct0 $(show_regex)


#cout "$F_GREEN;$BOLD" "Downloading Android SDK\n"

#set_HTTP_sample 'https://developer.android.com/sdk/index.html'
#draw_regex 'href="http://dl.google.com/android/[^"]+linux\.tgz'
#replace_regex 'href="'

#wget -ct0 $(show_regex)

