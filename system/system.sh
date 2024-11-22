#-------------------------------------------------------------------------------
# Source functions
#-------------------------------------------------------------------------------
local ROOT_DIR="$HOME/.antigen/bundles/edieguez/zsh-config"
PATH="$ROOT_DIR/bin:$PATH"

source $ROOT_DIR/system/environment.sh

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
load() {
    source "$ROOT_DIR/lib/$*"
}

md() {
    mkdir -vp "$*" && cd "$*"
}

numcat() {
    sed '/./=' $1 | sed '/./N;s/\n/ /'
}

activate() {
    source ~/.virtualenvs/$1/bin/activate
}
