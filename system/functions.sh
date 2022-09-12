numcat() {
    sed '/./=' $1 | sed '/./N;s/\n/ /'
}

google-translate() {
    trans en:es "$*"
}

# Load functions for local environment
source_if_exist "$ROOT_DIR/system/functions_local.sh"
