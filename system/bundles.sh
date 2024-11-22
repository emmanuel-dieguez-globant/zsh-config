# Load custom plugins
antibody bundle edieguez/zsh-config path:plugins kind:fpath

# Load ZSH plugins
export plugins=(
    command-not-found
    extract
    fzf
    git
    sudo
    z
)

# Load bundles for local environment
source_if_exist "$ROOT_DIR/system/bundles_local.sh"

antibody bundle robbyrussell/oh-my-zsh path:oh-my-zsh.sh
