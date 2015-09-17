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
    "$@";
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

# by atomantic <https://github.com/atomantic/dotfiles>
# function cask_install() {
#     # running "brew cask $1"
#     brew cask list $1 > /dev/null 2>&1 | true
#     if [[ ${PIPESTATUS[0]} != 0 ]]; then
#         # info "brew cask install $1 $2"
#         run brew cask install $1
#         if [[ $? != 0 ]]; then
#             error "failed to install $1! aborting..."
#         fi
#     fi
#     success
# }

# by atomantic <https://github.com/atomantic/dotfiles>
# function brew_install() {
#     # info "brew $1 $2"
#     brew list $1 > /dev/null 2>&1 | true
#     if [[ ${PIPESTATUS[0]} != 0 ]]; then
#         info "brew install $1 $2"
#         brew install $1 $2
#         if [[ $? != 0 ]]; then
#             error "failed to install $1! aborting..."
#         fi
#         success
#     fi
# }

function require_dev_tools() {
    # info "Looking for Developer Tools..."
    run xcode-select -v
    if [ $? -ne 0 ]; then
        heading "Installing Developer Tools..."
        run xcode-select --install
        # sudo xcode-select --switch /Library/Developer/CommandLineTools
    fi
    success
}

function bupdate_brew() {
    info "Updating Homebrew..."
    brew update && brew upgrade --all
}

function require_brew() {
    run brew -v
    if ! command -v brew &>/dev/null; then
        heading "Installing Homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if ask "Do you want to run 'brew doctor'?" Y; then
            heading "Running brew doctor..."
            brew doctor
        fi
    fi
    bupdate_brew
    success
}

function bupdate_npm() {
    info "Updating NPM..."
    npm update -g
}

# by atomantic <https://github.com/atomantic/dotfiles> adapted by me
function require_node() {
    run node -v
    if [[ $? != 0 ]]; then
        info "node not found, installing via homebrew"
        require_brew
        brew install node
    fi
    bupdate_npm
    success
}

# by atomantic <https://github.com/atomantic/dotfiles>
# function require_gem() {
#     info "gem $1"
#     if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]]; then
#         run gem install $1
#     fi
#     success
# }

function update_gems() {
    heading "Updating Gems..."
    # ruby -v
    # gem -v
    gem update
    # gem install bundler
    # gem update --system # it is not recommended to mess with OS X gems
    gem cleanup
    echo
}

# by atomantic <https://github.com/atomantic/dotfiles>
# function require_npm() {
#     sourceNVM
#     nvm use stable
#     info "npm $1"
#     npm list -g --depth 0 | grep $1@ > /dev/null
#     if [[ $? != 0 ]]; then
#         run npm install -g $1
#     fi
#     success
# }

# by atomantic <https://github.com/atomantic/dotfiles>
# function apm_install() {
#     info "checking atom plugin: $1"
#     apm list --installed --bare | grep $1@ > /dev/null
#     if [[ $? != 0 ]]; then
#         run apm install $1
#     fi
#     success
# }

# by atomantic <https://github.com/atomantic/dotfiles>
# function sourceNVM(){
#     export NVM_DIR=~/.nvm
#     source "$(brew --prefix nvm)/nvm.sh"
# }

# by atomantic <https://github.com/atomantic/dotfiles>
# function require_nvm() {
#     mkdir -p ~/.nvm
#     cp "$(brew --prefix nvm)/nvm-exec ~/.nvm/"
#     sourceNVM
#     nvm install $1
#     if [[ $? != 0 ]]; then
#         info "installing nvm"
#         curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
#         . ~/.bashrc
#         nvm install $1
#     fi
#     nvm use $1
#     success
# }

# by atomantic <https://github.com/atomantic/dotfiles>
function promptSudo() {
    # Ask for the administrator password upfront
    heading "I need you to enter your sudo password so I can install some things:"
    sudo -v

    # Keep-alive: update existing sudo time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

function install_shell() {
    require_brew

    heading "Installing zsh"
    brew install zsh

    heading "Set zsh as default shell"
    info "I need to gain sudo access to install zsh as you default shell."

    # check if zsh is in /etc/shells, if not add it to the list
    # by AlberT <http://stackoverflow.com/questions/3557037/appending-a-line-to-a-file-only-if-it-doesnt-already-exist-using-sed>
    grep -q -f /etc/shells "$(which zsh)"  || sudo bash -c "echo $(which zsh) >> /etc/shells" # command -v zsh | sudo tee -a /etc/shells
    # set the shell for the current user
    sudo chsh -s "$(which zsh)" "${USER}"

    heading "Download prezto to ${ZDOTDIR:-$HOME}./zprezto"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    heading "Install zprezto theme"
    cp "$DOTFILES/setup/prompt_josh_setup" "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_josh_setup"
    heading "Install terminal theme"

# by kevinSuttle and mathiasbynens <https://github.com/kevinSuttle/OSXDefaults>
# modefied to use my theme file
osascript <<EOD
tell application "Terminal"
local allOpenedWindows
local initialOpenedWindows
local windowID
set themeName to "publicarray"
(* Store the IDs of all the open terminal windows. *)
set initialOpenedWindows to id of every window
(* Open the custom theme so that it gets added to the list
of available terminal themes (note: this will open two
additional terminal windows). *)
do shell script "open '$HOME/.dotfiles/apps/" & themeName & ".terminal'"
(* Wait a little bit to ensure that the custom theme is added. *)
delay 1
(* Set the custom theme as the default terminal theme. *)
set default settings to settings set themeName
(* Get the IDs of all the currently opened terminal windows. *)
set allOpenedWindows to id of every window
repeat with windowID in allOpenedWindows
(* Close the additional windows that were opened in order
to add the custom theme to the list of terminal themes. *)
if initialOpenedWindows does not contain windowID then
close (every window whose id is windowID)
(* Change the theme for the initial opened terminal windows
to remove the need to close them in order for the custom
theme to be applied. *)
else
set current settings of tabs of (every window whose id is windowID) to settings set themeName
end if
end repeat
end tell
EOD

    heading "Symlinking Dotfiles"
    info "if dotfiles are found in your home directory they will be moved to $DOTFILES/backup."

    # if ask "Do you want to symlink dotfiles?"; then
    # sleep 2
    mkdir "$DOTFILES/backup"
    # symbolic link my own preztos dotfiles
    symlinkifne zprofile
    symlinkifne zshenv

    # symbolic link my modified dotfiles
    FILES="$DOTFILES/symlink/*"
    for f in $FILES
    do
        name=$(basename "$f")
        symlinkifne "$name"
    done

    if [[ $SHELL == *"bash"* ]]; then
        source ~/.bashrc
    else
        source ~/.zshrc
    fi
    echo
}

# by atomantic <https://github.com/atomantic/dotfiles> adapted by me
function symlinkifne {
    echo "♢ $1"

    if [[ -e ".$1" ]]; then
        # file exists
        if [[ -L ".$1" ]]; then
            # it's already a simlink (could have come from this project)
            echo -en '\tsimlink exists, skipped\t';ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e "$DOTFILES/backup/$1" ]];then
            mv "$HOME/.$1" "$DOTFILES/backup/"
            mv "$DOTFILES/backup/.$1" "$DOTFILES/backup/$1"
            echo -en 'backed up saved...';
        fi
    fi
    # create the link
    # ln -s ~/.dotfiles/symlink/$1 $1
    # ln -s $1 $2
    ln -s "$DOTFILES/symlink/$1" "$HOME/.$1"

    echo -en '\tlinked';
    success
}

function setup_sublime() {
    require_brew
    require_node

    heading "Installing packages for sublime linters..."
    info "Installing jshint csslint shellcheck and imagemagick..."
    npm install -g jshint csslint
    brew install shellcheck imagemagick # for ColourHighlighter
    info "You now have the following packages installed:"
    npm list -g --depth=0
    brew leaves
    success
    if [[ ! "$(type -P javac)" ]]; then
        info "For Java linting, Java SDK (javac) needs to be installed"
        sleep 2
        info "Opening Browser..."
        open http://www.oracle.com/technetwork/java/javase/downloads/index.html
    fi

    if ask "Do you want to install Sublime Text 3 packages and preferences?" Y; then
        if pgrep "Sublime Text"; then
            warn "If Sublime Text is open, please close it now or I will close it in 6 seconds..."
            sleep 6
            if pgrep "Sublime Text"; then
                warn "Closing Sublime Text..."
                sleep 1
                osascript -e 'quit app "Sublime Text"'
            fi
        fi
        heading "Installing Sublime Packages, Themes and Preferences..."
        # see https://packagecontrol.io/search/SublimeLinter-%20%3Ast3 for more linters
        SUBL=~/Library/Application\ Support/Sublime\ Text\ 3
        # get package control
        wget -nc "http://packagecontrol.io/Package%20Control.sublime-package" --directory-prefix "$SUBL/Installed Packages/"
        # copy files
        cp -a -i "$DOTFILES/apps/sublime/." "$SUBL/Packages/User/"
        # symbolic link sublime text so you can use in the shell
        heading "Symlinking Sublime Shell Command (subl) to the /usr/local/bin directory"
        ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
        info "If you need more linters visit: https://packagecontrol.io/search/SublimeLinter-%20%3Ast3"
        success
    fi
    echo
}

function setup_atom() {
    if ask "Do you want to install Atom packages? (requires Atom Shell Commands)" Y; then
        if [[ "$(type -P apm)" ]]; then
            heading "Installing Atom Packages and Themes"
            apm upgrade
            # see https://atom.io/packages/linter for more linters
            apm install atom-soda-dark-ui monokai editorconfig file-icons color-picker pigments dash atom-beautify linter linter-php linter-javac linter-jshint linter-clang linter-csslint linter-htmlhint highlight-selected
            # see https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers for more providers
            apm install atom-autocomplete-php # autocomplete-emojis autocomplete-paths
            # optional:
            # apm install git-control
            # apm install emmet - slows down start-up a bit >100ms
            # apm install autocomplete-plus
            # for autocomplete providers see https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers
            info "If you need more linters visit: https://atom.io/packages/linter for more linters"
            info "If require more autocomplete providers see: https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers"
        else
            error "Please Install Atom Shell Commands first."
            # heading "Symlinking Atom Shell Command (atom) to the /usr/local/bin directory"
            # ln -s /Applications/Atom.app/Contents/MacOS/Atom /usr/local/bin/atom
        fi
    fi
    echo
}

function setup_firfox() {
    info "Unfortunaly I can't do this automatically yet [working on it] :("
    info "Copy the contents of '~/.dotfiles/apps/firefox/' into '~/Library/Application\ Support/Firefox/Profiles/[your profile]/'"
    echo
}

function setup_osx() {
    promptSudo
    source "${HOME}/.dotfiles/setup/osx"

    info "Killing affected applications..."
    for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
        "Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
        "Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" \
        "Transmission" "Twitter"; do
        killall "${app}" > /dev/null 2>&1
    done
    success
    warn "Note that some of these changes require a logout/restart to take effect."
    echo
}
