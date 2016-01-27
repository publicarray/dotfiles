#!/bin/bash

DOTFILES=~/.dotfiles
source "$DOTFILES/setup/functions.sh"

cd ~/.zprezto
git pull origin master

cd "$DOTFILES"
# use git stash to keep user configurations
git stash
git pull origin master
git submodule update #git submodule foreach git pull
git stash pop
