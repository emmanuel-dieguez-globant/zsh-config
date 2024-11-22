#-------------------------------------------------------------------------------
# Source functions
#-------------------------------------------------------------------------------
export ROOT_DIR="$HOME/.zsh-config"

# Insert current directory into PATH variable
export CUSTOM_PATH=".:$ROOT_DIR/bin:$ROOT_DIR/bin/platform"

source $ROOT_DIR/system/environment.sh
source $ROOT_DIR/system/bundles.sh
source $ROOT_DIR/system/aliases.sh
source $ROOT_DIR/system/functions.sh
