# Clone antigen and custom repos
if [[ ! -e ~/.antigen ]]; then
    git clone https://github.com/zsh-users/antigen.git ~/.antigen
fi

if [[ ! -e ~/.bash ]]; then
    git clone git@github.com:edieguez/zsh-config.git .bash
    rm ~/.zshrc
    ln -s ~/.bash/lib/.zshrc ~/.zshrc
fi

# Antigen configuration
source ~/.antigen/antigen.zsh
source ~/.bash/lib/system.sh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle mvn
antigen bundle sudo
antigen bundle command-not-found

antigen theme edieguez/zsh-config themes/aya

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply
