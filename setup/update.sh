#!/bin/bash

DOTFILES=~/.dotfiles
source "$DOTFILES/setup/functions.sh"

cd ~/.zprezto
git pull origin master

cd "$DOTFILES"
# don't overwrite user configurations in the usershell file
git stash
git pull origin master
git stash pop
