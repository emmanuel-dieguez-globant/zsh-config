# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Apply prompt theme
antigen theme edieguez/zsh-config themes/aya

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle cp
antigen bundle extract
antigen bundle git
antigen bundle z

# Tell antigen that you're done.
antigen apply
