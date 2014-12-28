#!/bin/bash

heading() {
    printf "\n$(tput setaf 2)==== %s ====$(tput sgr0)\n" "$1"
}

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

heading "Downloading repository to ~/.dotfiles"
cd ~
git clone --recursive git://github.com/publicarray/dotfiles.git

if [ -d ".dotfiles" ]; then
  heading "Deleting old ~/.dotfiles"
  rm -rfd .dotfiles
fi
mv -iv dotfiles .dotfiles

bash .dotfiles/setup/install.sh
