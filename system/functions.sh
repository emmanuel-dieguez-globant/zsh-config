activate() {
    source ~/.virtualenvs/$1/bin/activate
}

jdk() {
  ln -sfn "$JDK_HOME/$1" $HOME/.current_jdk
}

unalias md
md() {
    mkdir -vp "$*" && cd "$*"
}

numcat() {
    sed '/./=' $1 | sed '/./N;s/\n/ /'
}

# Load functions for local environment
source_if_exist "$ROOT_DIR/system/functions_local.sh"
