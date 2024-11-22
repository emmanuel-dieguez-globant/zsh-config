#-------------------------------------------------------------------------------
# Source functions
#-------------------------------------------------------------------------------
local BASH_DIR="$HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-edieguez-SLASH-zsh-config.git"
PATH="$BASH_DIR:$PATH"

source $BASH_DIR/lib/regex.sh
source $BASH_DIR/lib/environment.sh

#-------------------------------------------------------------------------------
# System variables
#-------------------------------------------------------------------------------
# Font Colors ------------------------------------------------------------------
 F_BLACK=30;  F_RED=31;   F_GREEN=32;  F_YELLOW=33; F_BLUE=34;
F_PURPLE=35;  F_CYAN=36;  F_GRAY=37;   F_WHITE=38;

# Background Colors ------------------------------------------------------------
 B_BLACK=40;  B_RED=41;   B_GREEN=42;  B_YELLOW=43; B_BLUE=44;
B_PURPLE=45;  B_CYAN=46;  B_GRAY=47;

# Formats ----------------------------------------------------------------------
BOLD=01;  ITALIC=03  UNDER=04;  BLINK=05;  REVERSE=07;


#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------
alias show_external_ip='curl ip.appspot.com'
#alias hget='wget --header="Accept: text/html" --user-agent="Mozilla/5.0 (X11; Linux amd64; rv:32.0b4) Gecko/20140804164216 ArchLinux KDE Firefox/32.0b4" --referer=http://www.google.com -r http://www.sitio.com -e robots=off -k'

alias nyan_cat_telnet='timeout 10 telnet nyancat.dakko.us'
alias byakuren="grep -o --binary-files=text '[[:alpha:]]' /dev/urandom | tr -d '[a-zA-Z]' | xargs -n $(($COLUMNS-20)) | tr -d ' ' | lolcat -f | pv -qL32k"
alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'

#-------------------------------------------------------------------------------
# System functions
#-------------------------------------------------------------------------------
virtualenv() {
    if [ ! -d ~/.virtualenvs ]; then
        mkdir -v ~/.virtualenvs
    fi

    if [ $# -eq 0 ]; then
        echo "Available virtualenvs:"
        ls ~/.virtualenvs
    else
        /usr/bin/virtualenv --no-site-packages ~/.virtualenvs/$1
    fi

}

virtualenv3() {
    if [ ! -d ~/.virtualenvs ]; then
        mkdir -v ~/.virtualenvs
    fi

    if [ $# -eq 0 ]; then
        echo "Available virtualenvs:"
        ls ~/.virtualenvs
    else
        /usr/bin/virtualenv --python=/usr/bin/python3 --no-site-packages ~/.virtualenvs/$1
    fi
}

cout() {
    format=$1; shift
    echo -en "[${format}m""$*""[0m"
}

md() {
    mkdir -vp "$*" && cd "$*"
}

numcat() {
    sed '/./=' $1 | sed '/./N;s/\n/ /'
}

plus_delete () {
    for i in *; do
        mv -v "$i" "$(echo "$i" | sed 's/\+/ /g')"
    done
}

torget() {
    wget -e 'http_proxy = http://localhost:8118' $*
}

extract() {
    for i in "$*"; do
        if [ -f "$i" ] ; then
            case "$i" in
                *.tar.bz2)   tar xjf "$i"     ;;
                *.tar.gz)    tar xzf "$i"     ;;
                *.bz2)       bunzip2 "$i"     ;;
                *.rar)       unrar x "$i"     ;;
                *.gz)        gunzip "$i"      ;;
                *.tar)       tar xfv "$i"     ;;
                *.tbz2)      tar xjfv "$i"    ;;
                *.tgz)       tar xzfv "$i"    ;;
                *.zip)       unzip "$i"       ;;
                *.Z)         uncompress "$i"  ;;
                *.7z)        7z x "$i"        ;;

                *)     cout "$F_RED;$BOLD" "'$i' cannot be extracted via extract()\n"
                       return 2 ;;
            esac
        else
            cout "$F_RED;$BOLD" "'$i' is not a valid file\n"
            return 1
        fi
    done
}

update_plowshare() {
    git clone https://code.google.com/p/plowshare/ plowshare4
    cd plowshare4
    sudo make install
    cd ..
    rm -vr plowshare4
}

wikipedia() {
    if [ $# -eq 0 ]; then
        return
    else
        params=$*
        q=${params// /_}
    fi
    wget -qO - http://es.wikipedia.org/wiki/$q |\
    sed '/<table class="infobox/,/<\/table>/d' |\
    grep -m1 '<p>.*</p>' |\
    sed -e 's/<p>/\n/' -e 's/<\/p>/\n/' \
        -e 's/<[^>]*>//g' -e 's/\[[^]]*\]//g' |\
    sed -e 's/[0-9A-Za-z, ]*may refer to[:a-z ]*/ Ambiguous term/' \
        -e 's/[0-9A-Za-z, ]*can mean[:a-z ]*/ Ambiguous term/'
}

demi() {
    if [ $# -ge 1 ]; then
        timeout=$1
    else
        timeout=10
    fi

    while true; do
        xset dpms force off
        sleep $timeout
    done
}

activate() {
    source ~/.virtualenvs/$1/bin/activate
}

generate_qr() {
    while [[ $# != 0 ]]; do
        wget -cO "$1.png" "https://chart.googleapis.com/chart?chs=300x300&cht=qr&choe=UTF-8&chl=$2"
        shift; shift
    done
}

youtube-dl() {
	/usr/local/bin/youtube-dl $*
}

py2bin() {
    sudo find -iname __pycache__ -exec rm -vrf {} \;
    sudo find -iname "*.pyc" -exec rm -vrf {} \;
    zip -r "../$1.zip" *
    echo "#! /usr/bin/env python" | cat - "../$1.zip" > "../$1"
    rm "../$1.zip"
    chmod +x "../$1"
}

ovpn() {
    echo "
	script-security 2
	up /etc/openvpn/update-resolv-conf.sh
	down /etc/openvpn/update-resolv-conf.sh
    " >> "$1"
}

dropbox_sync() {
    dropbox start && watch -n1 dropbox status && dropbox stop
    dropbox autostart n
}

docker_stop() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}
