#! /usr/bin/env bash

which brewy &> /dev/null

if [[ $? == 0 ]]; then
    echo "Brew is installed in this system"

    echo "Updating brew applications"
    brew update
    brew upgrade

    echo "Updating cask applications"
    brew cask list | xargs brew cask install --force
else
    echo "Brew is not installed in this system"
    echo "to install it go to http://brew.sh"
    exit 1
fi