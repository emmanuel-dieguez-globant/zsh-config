#! /bin/bash
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
