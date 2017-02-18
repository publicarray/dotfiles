#!/bin/bash

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
    xcode-select -v
    if [ $? -ne 0 ]; then
        heading "Installing Developer Tools..."
        run_safe xcode-select --install
        # sudo xcode-select --switch /Library/Developer/CommandLineTools
    fi
    success
}

function update_brew() {
    info "Updating Homebrew..."
    brew update && brew upgrade
    brew cleanup
    brew cask cleanup
}

function require_brew() {
    if ! command -v brew &>/dev/null; then
        heading "Installing Homebrew..."
        run_safe ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if ask "Do you want to run 'brew doctor'?" Y; then
            heading "Running brew doctor..."
            run_safe brew doctor
        fi
        update_brew
        success
    fi
    run brew -v
}

function update_npm() {
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
    update_npm
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
    run ruby -v
    run gem -v
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
    run_safe brew install zsh
    run_safe brew cask install p4merge

    heading "Set zsh as default shell"
    info "I need to gain sudo access to install zsh as you default shell."

    # check if zsh is in /etc/shells, if not add it to the list
    # by AlberT <http://stackoverflow.com/questions/3557037/appending-a-line-to-a-file-only-if-it-doesnt-already-exist-using-sed>
    run_safe grep -q -f /etc/shells "$(which zsh)"  || sudo bash -c "echo $(which zsh) >> /etc/shells" # command -v zsh | sudo tee -a /etc/shells
    # set the shell for the current user
    run_safe sudo chsh -s "$(which zsh)" "${USER}"

    heading "Download prezto to ${ZDOTDIR:-$HOME}./zprezto"
    run_safe git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    heading "Install zprezto theme"
    run_safe cp "$DOTFILES/setup/prompt_josh_setup" "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_josh_setup"
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
        source "$HOME/.bashrc"
    else
        source "$HOME/.zshrc"
    fi
    echo
}

# by atomantic <https://github.com/atomantic/dotfiles> and adapted by me
function symlinkifne {
    echo "♢ $1"

    if [[ -e .$1 ]]; then
        # file exists
        if [[ -L .$1 ]]; then
            # it's already a simlink (could have come from this project)
            echo -en '\tsimlink exists, skipped\t';ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e "$DOTFILES/backup/$1" ]];then
            run_safe mv "$HOME/.$1" "$DOTFILES/backup/"
            run_safe mv "$DOTFILES/backup/.$1" "$DOTFILES/backup/$1"
            echo -en 'backup saved...';
        fi
    fi
    # create the link
    run_safe ln -s "$DOTFILES/symlink/$1" "$HOME/.$1"

    # echo -en '\tlinked';
    success "$1 linked"
}

# Setup Applications

function setup_sublime() {
    require_brew

    heading "Installing packages for sublime linters..."
    info "Installing scss_lint tidy-html5 shellcheck and imagemagick..."
    run_safe gem install scss_lint
    run_safe brew install shellcheck tidy-html5 imagemagick # for ColourHighlighter
    info "You now have the following packages installed:"
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
        run_safe wget -nc "http://packagecontrol.io/Package%20Control.sublime-package" --directory-prefix "$SUBL/Installed Packages/"
        # copy files
        run_safe cp -a -i "$DOTFILES/apps/sublime/." "$SUBL/Packages/User/"
        # symbolic link sublime text so you can use in the shell
        heading "Symlinking Sublime Shell Command (subl) to the /usr/local/bin directory"
        run_safe ln -sf /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

        # opt out of Sidebar Enhancement telemetry
        run_safe touch ~/.SideBarEnhancements.optout

        info "If you need more linters visit: https://packagecontrol.io/search/SublimeLinter-%20%3Ast3"
        info "You may need to restart Sublime Text twice, once for the Package Control installation and again for installing the remaining packages."
        success
    fi
    echo
}

function setup_atom() {
    if ask "Do you want to install Atom packages? (requires Atom Shell Commands)" Y; then
        if [[ "$(type -P apm)" ]]; then
            info "Installing scss_lint tidy-html5"
            run_safe gem install scss_lint
            run_safe brew install tidy-html5
            heading "Installing Atom Packages and Themes"
            run_safe apm upgrade --no-confirm
            # see https://atom.io/packages/linter for more linters
            run_safe apm install linter linter-php linter-javac linter-eslint linter-jsonlint linter-htmlhint linter-markdown linter-csslint linter-scss-lint linter-swiftc linter-clang linter-write-good
            run_safe apm install language-blade language-rust language-log language-patch language-salt
            run_safe apm install atom-soda-dark-ui monokai editorconfig file-icons color-picker pigments dash atom-beautify highlight-selected markdown-preview-opener
            run_safe apm install sync-settings
            # see https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers for more providers
            # apm install autocomplete-emojis autocomplete-paths autocomplete-clang atom-autocomplete-php
            # apm install git-control
            # apm install emmet - slows down start-up a bit >100ms
            # for autocomplete providers see https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers
            info "If you need more linters visit: https://atom.io/packages/linter for more linters"
            info "If require more autocomplete providers see: https://github.com/atom-community/autocomplete-plus/wiki/Autocomplete-Providers"
            success
        else
            error "Please Install Atom Shell Commands first."
            # heading "Symlinking Atom Shell Command (atom) to the /usr/local/bin directory"
            # ln -s /Applications/Atom.app/Contents/MacOS/Atom /usr/local/bin/atom
        fi
    fi
    echo
}

function setup_nano() {
    if ask "Do you want to install syntax highlighting for the nano text editor?" Y; then
        require_brew
        heading "Updating nano to latest version"
        brew install nano
        heading "Installing nano syntax highlighting from 'https://github.com/scopatz/nanorc' "
        curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
    fi
    success
    echo
}

function setup_firfox() {
    info "creating user.js"
    # cat "$DOTFILES/apps/firefox/user.js/user.js" "$DOTFILES/apps/firefox/myuser.js" > "$DOTFILES/apps/firefox/profile/user.js"
    run_safe cat "$DOTFILES/apps/firefox/ghacks-user.js/user.js" "$DOTFILES/apps/firefox/myuser.js" > "$DOTFILES/apps/firefox/profile/user.js"

    info "Unfortunately I can't do this automatically :("
    info "Copy the contents of '$DOTFILES/apps/firefox/profile' into '~/Library/Application\ Support/Firefox/Profiles/[your profile]/'"
    sleep 5
    info "Opening the folders..."
    sleep 2
    open "$DOTFILES/apps/firefox/profile"
    open "$HOME/Library/Application Support/Firefox/Profiles/"
    echo
}

function setup_DNSCrypt() {
    if ask "Do you want to install DNSCrypt with unbound?" Y; then
        promptSudo
        require_brew
        brew install dnscrypt-proxy --with-plugins
        info "Creating the daemons necessary so that the DNSCrypt-proxy service will start on every boot"
        promptSudo
        sudo cp -fv "$DOTFILES/apps/dnscrypt-proxy/homebrew.mxcl.dnscrypt-proxy.plist" /Library/LaunchDaemons # create a daemon
        # sudo cp -fv "$DOTFILES/apps/dnscrypt-proxy/homebrew.mxcl.dnscrypt-proxy2.plist" /Library/LaunchDaemons # create a daemon
        sudo chown root /Library/LaunchDaemons/*.plist # make root the owner
        sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist # start the service
        # sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy2.plist # start the service
        setup_unbound
        set_network_settings
        success
    elif ask "Do you only want to install DNSCrypt?" Y; then
        promptSudo
        require_brew
        brew install dnscrypt-proxy --with-plugins
        info "Creating the daemons necessary so that the DNSCrypt-proxy service will start on every boot"
        sudo cp -fv "$DOTFILES/apps/dnscrypt-proxy/homebrew.mxcl.dnscrypt-proxy3.plist" /Library/LaunchDaemons # create a demon
        sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy3.plist # make root the owner
        sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy3.plist # start the service
        set_network_settings
        success
    else
        info "Nothing has changed"
    fi
    echo
}

function setup_unbound() {
    # require_brew
    brew install unbound
    info "Creating the daemon necessary so that the unbound service will start on every boot"
    cp -fv "$DOTFILES/apps/unbound/unbound.conf" /usr/local/etc/unbound/unbound.conf # copy configuration
    sudo cp -fv /usr/local/opt/unbound/*.plist /Library/LaunchDaemons # create a daemon
    sudo chown root /Library/LaunchDaemons/homebrew.mxcl.unbound.plist # make root the owner
    sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.unbound.plist # start the service
}

function set_network_settings() {
    # this assumes you have wi-fi, bluetooth and ethernet adapters
    info "Changing network setting to use DNSCrypt at 127.0.0.1"
    warn "You may loose internet connectivity for a short period."
    sudo networksetup -createlocation DNSCrypt populate
    sudo networksetup -switchtolocation DNSCrypt
    sudo networksetup -setdnsservers Wi-Fi 127.0.0.1
    sudo networksetup -setdnsservers Ethernet 127.0.0.1
    sudo networksetup -setnetworkserviceenabled "Bluetooth PAN" off

    if ask "Do you want to add GoolegDNS and OpenDNS locations?" Y; then
        sudo networksetup -createlocation GoogleDNS populate
        sudo networksetup -switchtolocation GoogleDNS
        sudo networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4
        sudo networksetup -setdnsservers Ethernet 8.8.8.8 8.8.4.4
        sudo networksetup -setnetworkserviceenabled "Bluetooth PAN" off

        sudo networksetup -createlocation OpenDNS populate
        sudo networksetup -switchtolocation OpenDNS
        sudo networksetup -setdnsservers Wi-Fi 208.67.222.222 208.67.220.220
        sudo networksetup -setdnsservers Ethernet 208.67.222.222 208.67.220.220
        sudo networksetup -setnetworkserviceenabled "Bluetooth PAN" off

        sudo networksetup -switchtolocation DNSCrypt # switch back to DNSCrypt
    fi

    info "I have disabled Bluetooth PAN. You can enable it again in network settings."

    # networkservices="$(networksetup -listnetworkserviceorder | awk '{if (NR!=1) {print}}' | awk -F'\\) ' '/\(?\)/ {print $2}' | awk 'NF > 0')"
    # echo "$networkservices"

    # for networkservice in $networkservices
    # do
    #     sudo networksetup -setdnsservers "$networkservice" 127.0.0.1
    # done
}

function setup_osx() {
    promptSudo
    source "$DOTFILES/setup/osx"

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

# Quick look Plug-ins from: https://github.com/sindresorhus/quick-look-plugins
function install_quicklook_plugins() {
    brew cask install qlcolorcode
    brew cask install qlmarkdown
    brew cask install quicklook-json
    brew cask install qlprettypatch
    brew cask install quicklook-csv
    brew cask install betterzipql
    brew cask install qlimagesize
    brew cask install webpquicklook
    brew cask install suspicious-package
    success
    echo
}
