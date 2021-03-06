#!/bin/bash

reset=$(tput sgr0);
# halfbight=$(tput dim);
# bold=$(tput bold);
# underline=$(tput smul);

# blackbg=$(tput setab 0);
# whitebg=$(tput setab 7);

# black=$(tput setaf 0);
red=$(tput setaf 1);
green=$(tput setaf 2);
yellow=$(tput setaf 3);
blue=$(tput setaf 4);
# magenta=$(tput setaf 5);
# cyan=$(tput setaf 6);
# white=$(tput setaf 7);

heading() {
    printf "\n${green}♢ ==== %s ====${reset}\n" "$1"
}

info() {
    printf "♢ %b\n" "$1"
}

question() {
    printf "\n${blue}♢ %b${reset}" "$1"
}

success() {
    printf "${green}♢${reset}   [ ${green}OK${reset} ] %b\n" "$1"
}
alias ok="success"

warn() {
    printf "${yellow}♢${reset}   [${yellow}WARN${reset}] %b\n" "$1"
}

fail() {
    printf "${red}♢${reset}   [${red}ERROR${reset}] %b\n" "$1"
}

ask() {
    # http://djm.me/ask
    # or
    # https://gist.github.com/davejamesmiller/1965569
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question
        question "$1 [$prompt] "
        read -n1 -rp "" REPLY
        echo

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            [Yy]) return 0 ;;
            [Nn]) return 1 ;;
        esac

    done
}

clear
printf "\n"
printf "                                                                     \n"
printf "                           Welcome!                                  \n"
printf "              This script downloads dotfiles for Mac OS X            \n"
printf "                https://github.com/publicarray/dotfiles              \n"
printf "                                                                     \n"

# OSX-only stuff. Abort if not OSX.
if [[ "$OSTYPE" != darwin* ]]; then
    fail "Your operating system is not supported.\n Exiting."
    return 1
fi

info "I will clone the git repository to ~/.dotfiles"

if [ -d "${HOME}/.dotfiles" ]; then
    warn "${HOME}/.dotfiles already exists. I will overwrite them!"
fi

if ask "Do you want to Continue?" Y; then
    cd "${HOME}"
    if [ -d ".dotfiles" ]; then
      heading "Deleting old ~/.dotfiles"
      rm -rfd .dotfiles
    fi
    heading "Downloading repository to ~/.dotfiles"
    git clone --recursive https://github.com/publicarray/dotfiles.git "${HOME}/.dotfiles"

    # Don't track changes to usershell
    cd $DOTFILES
    git update-index --assume-unchanged symlink/usershell

    if ask "Do you want to run the install script now?\nYou can run it later with: '~/.dotfiles/setup/install.sh'" Y; then
        bash "${HOME}/.dotfiles/setup/install.sh"
    fi
fi
