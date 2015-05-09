#!/bin/bash

cd ~/.dotfiles/setup
. functions.sh
DOTFILES=~/.dotfiles
HOME=~

warn "Please install all AppStore apps first!"
info "eg. The Unarchiver, Pocket, Airmail2, BetterSnapTool, Sip, Caffine, Rdio, Dash, Battery Diag, Memory Diag, CleanMyDrive"

heading "Asking for the administrator privileges"
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode Command Line Tools
if [[ "$OSTYPE" =~ ^darwin ]] && [[ ! "$(type -P gcc)" ]]; then
    heading "Installing Xcode Command Line Tools"
    xcode-select --install
fi

# Install Homebrew
if [[ "$OSTYPE" =~ ^darwin ]] && [[ ! "$(type -P brew)" ]]; then
    heading "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ask "Do you want to run 'brew doctor'?"; then
    brew doctor
fi

heading "Updating Homebrew..."
brew update && brew upgrade

# Install prezto - a configuration framework for Zsh
if ask "Do you want to install zsh and prezto?"; then
    brew install zsh
    sudo bash -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
    sudo chsh -s /usr/local/bin/zsh $USERNAME
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
    bash $DOTFILES/setup/alias.sh
    source ~/.bash_profile
    source ~/.zprofile
fi

# Install brew packages
if ask "Do you want to install develoepr apps from Brewfile.sh?"; then
    info "installing: wget, git, git-ftp, ruby, python, php56, mcrypt, composer, heroku-toolbelt, aws-elasticbeanstalk, htmltidy"
    sh Brewfile.sh
fi

# Install Apps
if ask "Do you want to install GUI apps from Caskfile.sh?"; then
    info "VLC Player, Google Chrome, Firefox, Opera, Skype, Java, Flash player, GitHub, Sublime Text 3, Atom, SourceTree, CyberDuck, ImageOptim, CodeKit, MAMP, Flux, DesktopUtility, AppCleaner, Macpaw-Gemini, TogglDesktop, Minecraft, Steam, Rdio, Spotify, Adapter, HandBrake "
    sh Caskfile.sh
fi

# Update Ruby Gems
if ask "Do you want to update your Ruby gems?"; then
    ruby -v
    gem -v
    gem update
    # gem update --system # it is not recommended to mess with OS X gems
    gem cleanup
fi

# Install nvm, node, npm  and global packages
if ask "Do you want to install node, npm and global packages?"; then
    info "yo, bower, gulp, jshint"
    # clone the latest nvm (Node Version Manager) into a folder called .nvm
    git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
    source ~/.nvm/nvm.sh
    # install latest stable node
    nvm install stable
    nvm use stable
    nvm alias default stable
    # install packages
    npm install -g yo bower gulp jshint
fi

# Install sublime text packages
if ask "Do you want to install Sublime Text 3 packages?"; then
    SUBLFILES=$DOTFILES/sublime/*
    SUBL=~/Library/Application\ Support/Sublime\ Text\ 3
    # get package control
    wget -nc http://packagecontrol.io/Package%20Control.sublime-package -P $SUBL/Installed\ Packages/
    for f in $SUBLFILES
    do
        name=$(basename "$f")
        cp -i "$DOTFILES/sublime/$name" "$SUBL/Packages/User/"
    done

    # cp -i $DOTFILES/sublime/Package Control.sublime-settings $SUBL/Packages/User/
    # cp -i $DOTFILES/sublime/Preferences.sublime-settings $SUBL/Packages/User/
    # symbolic link sublime text so you can use in the shell
    ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
fi

# Install atom.io packages
if ask "Do you want to install Atom 3 packages? (requires Atom Shell Commands)"; then
    if [[ ! "$(type -P apm)" ]]; then
        ln -s /Applications/Atom.app/Contents/MacOS/Atom /usr/local/bin/atom
    fi
    apm install atom-soda-dark-ui monokai file-icons color-picker dash atom-beautify linter linter-php linter-javac linter-jshint linter-clang linter-csslint linter-htmlhint
    # optional:
    # apm install git-control
    # apm install emmet - slows down start-up a bit >100ms
    # apm install autocomplete-plus
    # for autocomplete providers see https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers
fi

heading "Done!"
