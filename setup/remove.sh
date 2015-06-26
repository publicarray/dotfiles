#!/bin/bash

cd ~/.dotfiles/setup
. functions.sh
DOTFILES=~/.dotfiles
HOME=~

# remove dotfiles
if ask "Do you want to restore dotfiles from backup?"; then
    FILES=$DOTFILES/backup/*
    for f in $FILES
    do
        name=$(basename "$f")
        if [ -f "$DOTFILES/backup/$name" ]
        	then
        	mv -v "$DOTFILES/backup/$name" "$HOME"
        	rm -f "$HOME/.$name"
        	mv -v "$HOME/$name" "$HOME/.$name"
        	rm -d "$DOTFILES/backup"
        fi
    done
fi

if ask "Are you sure you want to remove prezto?"; then
	rm -rf "$HOME/.zprezto"
fi

if ask "and remove zsh?"; then
	brew remove zsh
	chsh -s /bin/bash
fi
