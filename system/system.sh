source_if_exist() {
    if [ -e $1 ]; then
        source $1
    fi
}

# Custom enviroment and path modifications
export ROOT_DIR="$HOME/.zsh-config"
export CUSTOM_PATH=".:$ROOT_DIR/bin:$ROOT_DIR/bin/local"

# Local path has priority over default custom path
source_if_exist "$ROOT_DIR/system/environment_local.sh"
source "$ROOT_DIR/system/environment.sh"

PATH="$CUSTOM_PATH:$PATH"

# Antibody official site
# https://getantibody.github.io
export ANTIBODY_HOME=$HOME/.antibody
source <(antibody init)

# Source default configuration
source "$ROOT_DIR/system/bundles.sh"
source "$ROOT_DIR/system/aliases.sh"
source "$ROOT_DIR/system/functions.sh"

# Set custom theme
antibody bundle edieguez/zsh-config path:themes/aya.zsh-theme branch:antibody-migration
