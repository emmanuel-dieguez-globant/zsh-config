#! /usr/bin/env zsh

curl -sfL git.io/antibody | sh -s - -b /tmp

echo 'Installing basic configuration'
/tmp/antibody bundle edieguez/zsh-config path:themes/aya.zsh-theme branch:antibody-migration

echo 'Creating symbolic links'
ln -vsfn $HOME/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-edieguez-SLASH-zsh-config .zsh-config
ln -vsfn $HOME/.zsh-config/system/zshrc .zshrc

echo 'Moving Antobody binary to new path'
mv -v /tmp/antibody $HOME/.zsh-config/bin

echo 'Done. Restart your shell to finish the setup'