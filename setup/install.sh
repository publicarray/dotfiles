#!/bin/bash

cd ~/.dotfiles/setup
DOTFILES=~/.dotfiles
HOME=~
source "$DOTFILES/setup/functions.sh"

clear
printf "${black}${whitebg}\n"
printf "                                                                     \n"
printf "                           Welcome!                                  \n"
printf "              This script installs dotfiles for Mac OS X             \n"
printf "                https://github.com/publicarray/dotfiles              \n"
printf "                                                                     \n${reset}"

# OSX-only stuff. Abort if not OSX.
if [[ !["$OSTYPE" =~ ^darwin] ]]; then
    fail "Your operating system is not supported.\n Exiting."
    return -1
fi

info "If you are on a fresh install than please install all AppStore apps first!"
info "eg. The Unarchiver, Pocket, Airmail2, BetterSnapTool, Sip, Caffine, Rdio, Dash, Battery Diag, Memory Diag, CleanMyDrive"

info "\nIt is recommended to them in order:"

# heading "Asking for the administrator privileges"
# sudo -v
# # Keep-alive: update existing `sudo` time stamp until `.osx` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    echo
    # interactive menu from: http://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
    PS3='Please enter your choice or hit Enter to see the list again: '
    options=("Install Xcode Command Line Tools" "Install Homebrew" "Install node.js and npm" "Update Ruby Gems" "Upgrade shell with prezto" "Setup Text Editors" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Install Xcode Command Line Tools")
                xcode-select --install
                ;;
            "Install Homebrew")
                if [[ ! "$(type -P brew)" ]]; then
                    heading "Installing Homebrew"
                    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
                else
                    info "Homebrew is already Installed."
                fi
                heading "Updating Homebrew..."
                brew update && brew upgrade --all
                if ask "Do you want to run 'brew doctor'?" Y; then
                    heading "Running brew doctor..."
                    brew doctor
                fi
                if ask "Do you want to install Brew Packages from Brewfile.sh?\nThis will install: wget, git, git-ftp, php56, mcrypt and composer" Y; then
                    heading "Installing Packages"
                    sh Brewfile.sh
                fi
                if ask "Do you want to install GUI apps from Caskfile.sh?\nThis will install: VLC Player, Google Chrome, Firefox, Opera, Skype, Java, Flash player, GitHub, Sublime Text 3, Atom, SourceTree, CyberDuck, ImageOptim, CodeKit, MAMP, Flux, DesktopUtility, AppCleaner, Macpaw-Gemini, TogglDesktop, Minecraft, Steam, Rdio, Spotify, Adapter and HandBrake "; then
                    heading "Installing Applications"
                    sh Caskfile.sh
                fi
                echo
                ;;
            "Install node.js and npm")
                if [[ "$(type -P brew)" ]]; then
                    heading "Installing Node.js"
                    brew install node
                else
                    fail "Could not find brew. Homebrew is required to install node and npm"
                    # clone the latest nvm (Node Version Manager) into a folder called .nvm
                    #git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
                    #source ~/.nvm/nvm.sh
                    # install latest stable node
                    #nvm install stable
                    #nvm use stable
                    #nvm alias default stable
                fi
                if [[ "$(type -P npm)" ]]; then
                    if ask "Do you want to install global packages with npm?\n This will install: bower, gulp, jshint and csslint"; then
                        # install packages
                        heading "Installing Packages"
                        npm install -g bower gulp jshint csslint #yo
                    fi
                fi
                echo
                ;;
            "Update Ruby Gems")
                heading "Updating Gems..."
                ruby -v
                gem -v
                gem update
                # gem update --system # it is not recommended to mess with OS X gems
                gem cleanup
                echo
                ;;
            "Upgrade shell with prezto")
                if [[ "$(type -P brew)" ]]; then
                    heading "Installing zsh"
                    brew install zsh

                    heading "Set zsh as default shell"
                    # chsh -s /bin/zsh
                    # sudo bash -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
                    chsh -s /usr/local/bin/zsh $USERNAME

                    heading "Download prezto to ${ZDOTDIR:-$HOME}./zprezto"
                    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

                    heading "Install Theme"
                    cp "$DOTFILES/setup/prompt_josh_setup" "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_josh_setup"

                    heading "Symlinking Dotfiles"
                    info "if dotfiles are found in your home directory they will be moved to $DOTFILES/backup."

                    # if ask "Do you want to symlink dotfiles?"; then
                    sleep 2
                    mkdir "$DOTFILES/backup"
                    # symbolic link preztos own dotfiles
                    mv -v "$HOME/.zprofile" "$DOTFILES/backup"
                    mv -v "$DOTFILES/backup/.zprofile" "$DOTFILES/backup/zprofile"
                    ln -s "{ZDOTDIR:-$HOME}/.zprezto/runcoms/zprofile" "$HOME/.zprofile"

                    mv -v "$HOME/.zshenv" "$DOTFILES/backup"
                    ln -s "{ZDOTDIR:-$HOME}/.zprezto/runcoms/zshenv" "$HOME/.zshenv"
                    mv -v "$DOTFILES/backup/.zshenv" "$DOTFILES/backup/zshenv"

                    # symbolic link my modefied dotfiles
                    FILES=$DOTFILES/symlink/*
                    for f in $FILES
                    do
                        name=$(basename "$f")
                        mv -v "$HOME/.$name" "$DOTFILES/backup"
                        mv -v "$DOTFILES/backup/.$name" "$DOTFILES/backup/$name"
                        ln -s "$DOTFILES/symlink/$name" "$HOME/.$name"
                        info "Symlinked $HOME/.$name to $HOME/.$name"
                    done
                    source ~/.bashhrc
                    source ~/.zshrc
                    # fi
                else
                    fail "Could not find brew. Homebrew is required to install zsh"
                fi
                echo
                ;;
            "Setup Text Editors")
                # Install sublime text packages
                if ask "Do you want to install Sublime Text 3 packages and preferences?" Y; then
                    if pgrep "Sublime Text"; then
                        warn "If Sublime Text is open, please close it now or I will close it in 6 seconds"
                        sleep 6
                        if pgrep "Sublime Text"; then
                            warn "Closing Sublime Text"
                            sleep 1
                            osascript -e 'quit app "Sublime Text"'
                        fi
                    fi
                    heading "Installing Sublime Packages, Themes and Preferences"
                    SUBLFILES=$DOTFILES/sublime/*
                    SUBL=~/Library/Application\ Support/Sublime\ Text\ 3
                    # get package control
                    wget -nc "http://packagecontrol.io/Package%20Control.sublime-package" --directory-prefix "$SUBL/Installed Packages/"
                    for f in $SUBLFILES
                    do
                        name=$(basename "$f")
                        cp -i "$DOTFILES/sublime/$name" "$SUBL/Packages/User/"
                    done

                    # cp -i $DOTFILES/sublime/Package Control.sublime-settings $SUBL/Packages/User/
                    # cp -i $DOTFILES/sublime/Preferences.sublime-settings $SUBL/Packages/User/
                    # symbolic link sublime text so you can use in the shell
                    heading "Symlinking Sublime Shell Command (subl) to the /usr/local/bin directory"
                    ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
                fi

                # Install atom.io packages
                if ask "Do you want to install Atom packages? (requires Atom Shell Commands)" Y; then
                    if [[ "$(type -P apm)" ]]; then
                        heading "Installing Sublime Packages and Themes"
                        apm install atom-soda-dark-ui monokai file-icons color-picker dash atom-beautify linter linter-php linter-javac linter-jshint linter-clang linter-csslint linter-htmlhint
                        # optional:
                        # apm install git-control
                        # apm install emmet - slows down start-up a bit >100ms
                        # apm install autocomplete-plus
                        # for autocomplete providers see https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers
                    else
                        fail "Please Install Atom Shell Commands first."
                        # heading "Symlinking Atom Shell Command (atom) to the /usr/local/bin directory"
                        # ln -s /Applications/Atom.app/Contents/MacOS/Atom /usr/local/bin/atom
                    fi
                fi
                echo
                ;;
            "Quit")
                break
                ;;
            *) echo invalid option;;
        esac
    done

heading "Done!"
