#!/bin/bash
#
# http://wiki.bash-hackers.org/commands/builtin/printf

reset=$(tput sgr0);
# halfbight=$(tput dim);
bold=$(tput bold);
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

function heading() {
    printf "\n\n${green}♢ ==== %s ====${reset}\n" "$1"
}

function info() {
    printf "\n♢ %b\n" "$1"
}

function question() {
    printf "\n${blue}♢ %b${reset}" "$1"
}

function run() {
    printf "\n♢ ${bold}";
    printf "%s" "$@";
    printf "${reset}:\n";
}

function run_safe() {
    printf "\n♢ ${bold}">&0
    printf "%s " "$@">&0
    printf "\b${reset}:\n">&0
    "$@"
    statuscode=$?
    if [[ "$statuscode" -ne "0" ]]; then
        error "The command executing at the time of the error was:">&2
        printf "${yellow}%s " "$@">&2
        echo "on line: ${BASH_LINENO[0]}${reset}">&2
        exit $statuscode
    fi
}

function success() {
    printf "${green}♢${reset}   [ ${green}OK${reset} ] %b\n" "$1"
}

function warn() {
    printf "${yellow}♢${reset}   [${yellow}WARN${reset}] %b\n" "$1"
}

function error() {
    printf "${red}♢${reset}   [${red}ERROR${reset}] %b\n" "$1"
    return 1
}

function ask() {
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
