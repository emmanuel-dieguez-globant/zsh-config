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
