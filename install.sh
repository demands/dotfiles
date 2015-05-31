#!/usr/bin/env bash

if ! which -s brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ -d $HOME/Projects/dotfiles ] && ! [ -L $HOME/.dotfiles ]; then
  ln -s $HOME/Projects/dotfiles $HOME/.dotfiles
fi

source $HOME/.dotfiles/hooks/pre-up

echo "Setting up osx defaults..."
source $HOME/.dotfiles/hooks/osx_defaults

RCRC=$HOME/.dotfiles/rcrc rcup
