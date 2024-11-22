source <(antibody init)

antibody bundle robbyrussell/oh-my-zsh path:plugins/extract
antibody bundle robbyrussell/oh-my-zsh path:plugins/sudo
antibody bundle robbyrussell/oh-my-zsh path:plugins/z

# Load oh-my-zsh completions
antibody bundle robbyrussell/oh-my-zsh path:lib/completion.zsh

# Set custom theme
antibody bundle edieguez/zsh-config path:themes/aya.zsh-theme branch:antibody-migration
