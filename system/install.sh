#! /usr/bin/env zsh
export ANTIBODY_HOME=$HOME/.antibody
mkdir -vp $HOME/.antibody

curl -sfL git.io/antibody | sh -s - -b $ANTIBODY_HOME

echo 'Installing basic configuration'
$ANTIBODY_HOME/antibody bundle edieguez/zsh-config path:themes/aya.zsh-theme branch:antibody-migration

echo 'Creating symbolic links'
ln -vsfn $ANTIBODY_HOME/https-COLON--SLASH--SLASH-github.com-SLASH-edieguez-SLASH-zsh-config $HOME/.zsh-config
ln -vsfn $HOME/.zsh-config/system/zshrc $HOME/.zshrc

echo 'Moving Antobody binary to new path'
mv -v $ANTIBODY_HOME/antibody $HOME/.zsh-config/bin

echo 'Done. Restart your shell to finish the setup'