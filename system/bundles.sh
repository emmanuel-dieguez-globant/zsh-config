# Load ZSH plugins
export plugins=(
    command-not-found
    extract
    fzf
    git
    sudo
    virtualenv_py
    z
)

# Load bundles for local environment
source_if_exist "$ROOT_DIR/system/bundles_local.sh"

antibody bundle robbyrussell/oh-my-zsh path:oh-my-zsh.sh

# https://github.com/zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-syntax-highlighting path:zsh-syntax-highlighting.plugin.zsh

# https://sdkman.io/install
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
