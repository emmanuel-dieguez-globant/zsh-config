# Autor aeelinn

cout() {
  printf "\e[$1m$2\e[0m"
}

isOnline() {
  MESSAGE="$(HEAD -d $DOMAIN)\n"
}

msg() {
  local MESSAGE='Finished.\n'

  cout "$BOLD;$GREEN" "$1"

  $2

  if [ $? -eq 0 ];then
    cout "$BOLD;$BLUE" "$MESSAGE"
  else
    cout "$BOLD;$RED"  "$MESSAGE"
    exit 1
  fi
}

getHost() {
  DOMAIN=$(echo ${URL,,} | egrep -io $DOMAINS)

  case $DOMAIN  in
    '')
      cout  "$BOLD;$RED"  'Dominio no soportado.\n'
      exit 1
      ;;
    *)
      domain
      ;;
  esac
}

domain() {
  case $1 in
    '')
      $DOMAIN
      ;;

    'manga')
      getSeed

      $DOMAIN manga

      if [ -n "$REGEX" ] ;then
        MANGA="$REGEX"
        MESSAGE="$REGEX\n"
      else
        MESSAGE="Undefined\n"
        false
      fi
      ;;

    'pages')
      $DOMAIN pages

      if [ -n "$REGEX" ] ;then
        PAGES="$REGEX"
        MESSAGE="$REGEX\n"
      else
        MESSAGE="Undefined\n"
        false
      fi
      ;;

    'url')
      $DOMAIN url
      URL="$REGEX"
      ;;

    *)
      $DOMAIN $*
      ;;
  esac
}

getImg() {
  mkdir "$MANGA"

  BASE="$(dirname $URL)/"

  for INDEX in $(seq $PAGES); do
    domain url
    getSeed
    domain img
    wget -qcT 10 -U "$USERAGENT" --directory-prefix="$MANGA" $REGEX

    [ $? -eq 0 ] &&
      cout "$BOLD;$CYAN" '.' ||
      cout "$BOLD;$RED"  '.'
  done
}

getSeed() {
  SEED=$(wget -U $USERAGENT -qO- $URL)
}

setRegex() {
  REGEX="$*"
}

getRegex() {
  REGEX=$(echo "$SEED" | egrep -io "$1")
}

remRegex() {
  REGEX=$(echo "$REGEX" | sed -r "s/$1//g")
}

getIndex() {
  REGEX=$(echo "$REGEX" | sed -rn $1p)
}

getLast() {
  REGEX=$(echo "$REGEX" | tail -n1)
}

mangafox.me() {
  case $1 in
    '')
      # x2 [1]
      IMGREGEX='http://.\.mfcdn.net/store/manga/[[:digit:]]+/[[:digit:][:punct:]]+/compressed/[[:alnum:][:punct:]]+.jpg'
      MESSAGE="$FUNCNAME [ http://mangafox.me ]\n"
      ;;

    'manga')
      getRegex 'for [[:alnum:] \.]+"'
      remRegex 'for\ '
      remRegex '"'
      ;;

    'pages')
      getRegex 'of [[:digit:]]+'
      getIndex 1
      remRegex 'of '
      ;;

    'url')
      setRegex "$BASE$INDEX.html"
      ;;

    'img')
      getRegex "$IMGREGEX"
      getIndex 1
      ;;
  esac
}

submanga.com() {
  case $1 in
    '')
      IMGREGEX='http://[[:alnum:][:punct:]]+/pages/[[:digit:]]+/[[:alnum:]]+/[[:alnum:]]+\.jpg'
      MESSAGE="$FUNCNAME [ http://submanga.com ]\n"
      # URL Fix
      URL="$(echo $URL | egrep -io http://submanga.com/c/[[:digit:]]+)/1"
      ;;

    'manga')
      getRegex '<title>[[:alnum:][:punct:] ]+&mdash;'
      remRegex '<title>'
      remRegex ' &mdash;.+'
      ;;

    'pages')
      getRegex 'value="[[:digit:]]+'
      remRegex 'value="'
      getLast
      ;;

    'url')
      setRegex "$BASE$INDEX"
      ;;

    'img')
      getRegex "$IMGREGEX"
      ;;
  esac
}

# C-out colors and formats
 BOLD=01;   UNDER=04;  BLINK=05;  REVERSE=07;  BLACK=30;   RED=31;
GREEN=32;  YELLOW=33;   BLUE=34;  MAGENTA=35;   CYAN=36;  GREY=37;

# System Variables
   DOMAIN='http://google.com'
USERAGENT='Windows 9 Alpha'

# Regex Variables
     SEED='N/A'
    REGEX='N/A'
 IMGREGEX='N/A'

# Domain Variables
  DOMAINS='mangafox.me|mangapanda.com|submanga.com'
 IMGREGEX='N/A'

cout "$UNDER;$BOLD;$CYAN" '\tDraw.sh SID\n'

  msg '\tFunction system/isOnline   ' isOnline

for URL in $@; do
  msg '\tFunction  domain/getHost   ' getHost
  msg '\tFunction    domain/manga   ' domain\ manga
  msg '\tFunction    domain/pages   ' domain\ pages
  msg '\tFunction     main/getImg   ' getImg
done
