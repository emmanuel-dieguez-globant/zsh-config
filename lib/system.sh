#-------------------------------------------------------------------------------
# Source functions
#-------------------------------------------------------------------------------
local BASH_DIR="$HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-edieguez-SLASH-zsh-config.git"
PATH="$BASH_DIR:$PATH"

# source $BASH_DIR/lib/regex.sh
source $BASH_DIR/lib/environment.sh

#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------
alias measure_temp='/opt/vc/bin/vcgencmd measure_temp'
alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3'
#alias show_external_ip='curl ip.appspot.com'
#alias hget='wget --header="Accept: text/html" --user-agent="Mozilla/5.0 (X11; Linux amd64; rv:32.0b4) Gecko/20140804164216 ArchLinux KDE Firefox/32.0b4" --referer=http://www.google.com -r http://www.sitio.com -e robots=off -k'

#alias nyan_cat_telnet='timeout 10 telnet nyancat.dakko.us'
#alias byakuren="grep -o --binary-files=text '[[:alpha:]]' /dev/urandom | tr -d '[a-zA-Z]' | xargs -n $(($COLUMNS-20)) | tr -d ' ' | lolcat -f | pv -qL32k"
#alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'

#-------------------------------------------------------------------------------
# System functions
#-------------------------------------------------------------------------------
md() {
    mkdir -vp "$*" && cd "$*"
}

numcat() {
    sed '/./=' $1 | sed '/./N;s/\n/ /'
}

dropbox_sync() {
    dropbox start && watch -n1 dropbox status && dropbox stop
    dropbox autostart n
}

activate() {
    source ~/.virtualenvs/$1/bin/activate
}

#update_plowshare() {
#    git clone https://code.google.com/p/plowshare/ plowshare4
#    cd plowshare4
#    sudo make install
#    cd ..
#    rm -vr plowshare4
#}

#wikipedia() {
#    if [ $# -eq 0 ]; then
#        return
#    else
#        params=$*
#        q=${params// /_}
#    fi
#    wget -qO - http://es.wikipedia.org/wiki/$q |\
#    sed '/<table class="infobox/,/<\/table>/d' |\
#    grep -m1 '<p>.*</p>' |\
#    sed -e 's/<p>/\n/' -e 's/<\/p>/\n/' \
#        -e 's/<[^>]*>//g' -e 's/\[[^]]*\]//g' |\
#    sed -e 's/[0-9A-Za-z, ]*may refer to[:a-z ]*/ Ambiguous term/' \
#        -e 's/[0-9A-Za-z, ]*can mean[:a-z ]*/ Ambiguous term/'
#}

#torget() {
#    wget -e 'http_proxy = http://localhost:8118' $*
#}

#ovpn() {
#    echo "
#	script-security 2
#	up /etc/openvpn/update-resolv-conf.sh
#	down /etc/openvpn/update-resolv-conf.sh
#    " >> "$1"
#}

#docker_stop() {
#    docker stop $(docker ps -a -q)
#    docker rm $(docker ps -a -q)
#}

#plus_delete () {
#    for i in *; do
#        mv -v "$i" "$(echo "$i" | sed 's/\+/ /g')"
#    done
#}
