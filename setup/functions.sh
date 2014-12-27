#!/bin/bash

bold=$(tput bold);
reset=$(tput sgr0);
black=$(tput setaf 0);
blue=$(tput setaf 33);
cyan=$(tput setaf 37);
green=$(tput setaf 2);
orange=$(tput setaf 166);
purple=$(tput setaf 125);
red=$(tput setaf 124);
violet=$(tput setaf 61);
white=$(tput setaf 15);
yellow=$(tput setaf 11);
magenta=$(tput setaf 125);

heading() {
    printf "\n${green}==== %s ====${reset}\n" "$1"
}

info() {
    printf "${blue}%s${reset}\n" "$1"
}

question() {
    printf "\n${yellow}==== %s ====${reset}" "$1"
}

success() {
    printf "  [ ${green}OK${reset} ] %s\n" "$1"
}

warn() {
    printf "  [${orange}WARN${reset}] %s\n" "$1"
}

fail() {
    printf "  [${red}FAIL${reset}] %s\n" "$1"
    return 8
}

ask() {
    # http://djm.me/ask
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