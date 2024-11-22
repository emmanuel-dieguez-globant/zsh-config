# Clone antigen and custom repos
if [[ ! -e ~/.antigen ]]; then
    git clone https://github.com/zsh-users/antigen.git ~/.antigen
fi

# Antigen configuration
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle grails
antigen bundle mvn
antigen bundle sudo
antigen bundle pip
antigen bundle vagrant
antigen bundle command-not-found

antigen theme edieguez/zsh-config themes/aya

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

# Custom configuration
if [[ ! -L ~/.zshrc ]]; then
	rm ~/.zshrc
    ln -s ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-edieguez-SLASH-zsh-config.git/lib/.zshrc ~/.zshrc
fi

unalias md
source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-edieguez-SLASH-zsh-config.git/lib/system.sh
