#!/bin/bash -
#===============================================================================
#
#          FILE: danbooru.sh
#
#         USAGE: ./danbooru.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: aeelinn
#  ORGANIZATION:
#       CREATED: 03/03/14 20:04
#      REVISION:  ---
#===============================================================================

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

# System functions =============================================================
get_characters() {
	restore_sample

	draw_regex '<h2>Characters</h2>.+<h2>Artist</h2>'
	draw_regex 'tags=[^"]+'
	replace_regex 'tags='

	delete_new_lines

	characters=$(show_regex)
}

get_artist() {
	restore_sample

	draw_regex '<h2>Artist</h2>.+<h1>Tags</h1>'
	draw_regex 'tags=[^<]+'
	draw_regex '>.+'
	replace_regex '>'

	artist=$(show_regex)
}

get_id() {
	restore_sample

	draw_regex 'ID: [[:digit:]]+'
	draw_regex '[[:digit:]]+'

	id=$(show_regex)
}

get_rating() {
	restore_sample

	draw_regex 'Rating: [^<]+'
	replace_regex 'Rating: '

	rating=$(show_regex)
}

get_image_link() {
	restore_sample

	draw_regex 'Size:[^>]+'
	draw_regex '/data/[^"]+'

	image_link="http://danbooru.donmai.us$(show_regex)"
}

get_image() {
	get_characters
	get_artist
	get_id
	get_rating
	get_image_link
	extension=$(echo $image_link | egrep -io '\.[[:alnum:]]+$' )

	image_custom_name="${artist-unknow}-${rating-unrated}-$id-${characters-original}$extension"
	image_default_name="${artist-unknow}-${rating-unrated}-$id-various$extension"

	if [ ${#image_custom_name} -lt 250 ]; then
		echo $image_custom_name > $rgx_file
	else
		cout "$F_YELLOW;$BOLD" " [!] Name too large. Using default name\n"
		echo $image_default_name > $rgx_file
	fi

	delete_new_lines

	image_name=$(echo $(show_regex) | tr 'A-Z' 'a-z')

	interface

	wget -cqO "$image_name" "$image_link"
}

interface() {
	cout "$BOLD;$F_GREEN" " [$((++cnt))]  "
	cout "$F_CYAN" "$image_name\n"
}

# Iterator =====================================================================
for_each_link() {
    for i in $links; do
        set_HTTP_sample "$i"
        get_image
    done
}

get_next_page() {
    restore_sample

    draw_regex 'rel="next" href="[^"]+"'
    replace_regex 'rel="next" '
    draw_regex '"[^"]+"'
    draw_regex '[^"]+'

    if [ -z "$(show_regex)" ]; then
        next_page=""
    else
        next_page="http://danbooru.donmai.us/$(show_regex)"
    fi
}

get_links() {
    restore_sample

    draw_regex 'href="/posts/[[:digit:]]+[^"]+'
    draw_regex '"/posts/[[:digit:]]+[^"]+'
    draw_regex '[^"]+'

    replace_regex '\/posts' 'http:\/\/danbooru.donmai.us\/posts'

    links=$(show_regex)
}

# Main function ================================================================
init_regex

next_page="$1"

while [ -n "$next_page" ]; do
	cout "$F_RED;$BOLD" "[index] $next_page\n"

    set_HTTP_sample "$next_page"
    get_next_page

    get_links

    for_each_link
done
