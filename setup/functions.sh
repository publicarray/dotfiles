#!/bin/bash
#
# http://wiki.bash-hackers.org/commands/builtin/printf

reset=$(tput sgr0);
halfbight=$(tput dim);
bold=$(tput bold);
underline=$(tput smul);

blackbg=$(tput setab 0);
whitebg=$(tput setab 7);

black=$(tput setaf 0);
red=$(tput setaf 1);
green=$(tput setaf 2);
yellow=$(tput setaf 3);
blue=$(tput setaf 4);
magenta=$(tput setaf 5);
cyan=$(tput setaf 6);
white=$(tput setaf 7);

heading() {
    printf "\n${green}${blackbg}==== %s ====${reset}\n" "$1"
}

info() {
    printf "${black}${whitebg}%b${reset}\n" "$1"
}

question() {
    printf "\n${blue}${whitebg}%b${reset}" "$1"
}

success() {
    printf "${blackbg}${white}  [ ${green}OK${white} ] %b${reset}\n" "$1"
}

warn() {
    printf "${blackbg}${white}  [${yellow}WARN${white}] %b${reset}\n" "$1"
}

fail() {
    printf "${blackbg}${white}  [${red}FAIL${white}] %b${reset}\n" "$1"
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
