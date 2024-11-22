source_if_exist() {
    if [ -e $1 ]; then
        source $1
    fi
}

export ROOT_DIR="$HOME/.zsh-config"
export ZSH_CUSTOM=$ROOT_DIR

source_if_exist "$ROOT_DIR/system/environment_local.sh"
source "$ROOT_DIR/system/environment.sh"

# https://getantibody.github.io
export ANTIBODY_HOME=$HOME/.antibody
source <($ROOT_DIR/bin/antibody init)

source "$ROOT_DIR/system/bundles.sh"
source "$ROOT_DIR/system/aliases.sh"
source "$ROOT_DIR/system/functions.sh"

if [ -n "$CUSTOM_PATH" ]; then
    PATH="$CUSTOM_PATH:$PATH"
fi

PATH=".:$ROOT_DIR/bin:$ROOT_DIR/bin/local:$PATH"

# Set custom theme
antibody bundle edieguez/zsh-config path:themes/aya.zsh-theme branch:antibody-migration
