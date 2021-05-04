# Custom enviroment and path modifications
export ROOT_DIR="$HOME/.zsh-config"
export CUSTOM_PATH=".:$ROOT_DIR/bin:$ROOT_DIR/bin/platform"
source $ROOT_DIR/system/environment.sh

# Antibody official site
# https://getantibody.github.io
export ANTIBODY_HOME=$HOME/.antibody
source <(antibody init)

# Default and custom bundles
source $ROOT_DIR/system/bundles.sh

antibody bundle robbyrussell/oh-my-zsh path:oh-my-zsh.sh
antibody bundle robbyrussell/oh-my-zsh path:plugins/command-not-found
antibody bundle robbyrussell/oh-my-zsh path:plugins/extract
antibody bundle robbyrussell/oh-my-zsh path:plugins/fzf
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/sudo
antibody bundle robbyrussell/oh-my-zsh path:plugins/z

# Set custom theme
antibody bundle edieguez/zsh-config path:themes/aya.zsh-theme branch:antibody-migration

# Default and custom aliases
source $ROOT_DIR/system/aliases.sh

# Default and custom functions
source $ROOT_DIR/system/functions.sh
