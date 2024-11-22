# Load custom plugins
antibody bundle edieguez/zsh-config path:plugins kind:fpath

# Load oh-my-zsh
antibody bundle robbyrussell/oh-my-zsh path:oh-my-zsh.sh

# Set custom theme
antibody bundle edieguez/zsh-config path:themes/aya.zsh-theme branch:antibody-migration
