# Clone antigen and custom repos
if [[ ! -e ~/.antigen ]]; then
    git clone https://github.com/zsh-users/antigen.git ~/.antigen
fi

# Antigen configuration
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle extract
antigen bundle git
antigen bundle mvn
antigen bundle sudo
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions

# Apply prompt theme
antigen theme edieguez/zsh-config themes/aya

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

# Custom configuration
if [[ ! -L ~/.zshrc ]]; then
    rm ~/.zshrc
    ln -s ~/.antigen/bundles/edieguez/zsh-config/system/.zshrc ~/.zshrc
fi

unalias md
source ~/.antigen/bundles/edieguez/zsh-config/system/system.sh
