#!/bin/bash

DOTFILES=~/.dotfiles
source "$DOTFILES/setup/functions.sh"

cd ~/.zprezto;
git pull origin master;

cd "$DOTFILES";
git pull origin master;
