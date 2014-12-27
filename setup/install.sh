#!/bin/bash

cd ~/.dotfiles/setup
. functions.sh
DOTFILES=~/.dotfiles
HOME=~

warn "Please Install all AppStore Apps first!"
info "eg. The Unarchiver, Pocket, Airmail2, BetterSnapTool, Sip, Caffine, Rdio, Dash, Battery Diag, Memory Diag, CleanMyDrive"

# Install Xcode Command Line Tools
if [[ "$OSTYPE" =~ ^darwin ]] && [[ ! "$(type -P gcc)" ]]; then
    heading "Install Xcode Command Line Tools"
    xcode-select --install
fi

# Install Homebrew
if [[ "$OSTYPE" =~ ^darwin ]] && [[ ! "$(type -P brew)" ]]; then
    heading "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ask "Do you want to Run 'brew doctor'?"; then
    brew doctor
fi

heading "Updating Homebrew"
brew update

# Install prezto - a configuration framework for Zsh
if ask "Do you want to install prezto?"; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# symbolic link dotfiles
if ask "Do you want to symlink dotfiles?"; then
    mkdir "$DOTFILES/backup"
    FILES=$DOTFILES/symlink/*
    for f in $FILES
    do
        name=$(basename "$f")
        mv -v "$HOME/.$name" "$DOTFILES/backup"
        mv -v "$DOTFILES/backup/.$name" "$DOTFILES/backup/$name"
        ln -s "$DOTFILES/symlink/$name" "$HOME/.$name"
    done
fi
info "open shell preferences and in the General tab, select 'shells open with command (complete path):' and enter '/usr/local/bin/zsh' as the path"

# Install brew packages
if ask "Do you want to Install Develoepr Apps from Brewfile.sh?"; then
    info "installing: wget, zsh, git, git-ftp, php56, mcrypt, composer, heroku-toolbelt, aws-elasticbeanstalk"
    sh Brewfile.sh
fi

# Install Apps
if ask "Do you want to Install GUI Apps from Caskfile.sh?"; then
    info "VLC Player, Google Chrome, Firefox, Opera, Skype, Java, flash-player, GitHub, Sublime Text, Atom, SourceTree, Node.js, CyberDuck, ImageOptim, CodeKit, MAMP, Flux, DesktopUtility, AppCleaner, Macpaw-Gemini, TogglDesktop, Minecraft, Steam, Rdio, Spotify, Adapter, HandBrake "
    sh Caskfile.sh
fi

heading "Asking for the administrator privileges"
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update Ruby Gems
if ask "Do you want to Update your Ruby Gems?"; then
    sudo gem update
    gem cleanup
fi

# Install npm global packages
if ask "Do you want to Install npm global Packages?"; then
    info "grunt, grunt-cli, bower"
    sudo npm install -g grunt
    sudo npm install -g grunt-cli
    sudo npm install -g bower
fi

heading "Done!"
