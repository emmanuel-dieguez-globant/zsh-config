# Custom enviroment and path modifications
export ROOT_DIR="$HOME/.zsh-config"
export CUSTOM_PATH=".:$ROOT_DIR/bin:$ROOT_DIR/bin/platform"
source $ROOT_DIR/system/environment.sh

export ANTIBODY_HOME=$HOME/.antibody
source <(antibody init)

# Default and custom bundles
antibody bundle robbyrussell/oh-my-zsh path:plugins/extract
antibody bundle robbyrussell/oh-my-zsh path:plugins/sudo
antibody bundle robbyrussell/oh-my-zsh path:plugins/z

source $ROOT_DIR/system/bundles.sh

# Default and custom aliases
source $ROOT_DIR/system/aliases.sh

# Default and custom functions
source $ROOT_DIR/system/functions.sh
