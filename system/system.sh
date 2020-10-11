#-------------------------------------------------------------------------------
# Source functions
#-------------------------------------------------------------------------------
export ROOT_DIR="$HOME/.zsh-config"

source $ROOT_DIR/system/environment.sh
source $ROOT_DIR/system/bundles.sh
source $ROOT_DIR/system/aliases.sh
source $ROOT_DIR/system/functions.sh

# Insert current directory into PATH variable
export PATH=".:$ROOT_DIR/bin$PATH"
