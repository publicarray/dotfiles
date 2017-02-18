#!/bin/bash

DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES/setup" || exit
source functions.sh
source install_functions.sh

clear
printf "\n"
printf "                                                                     \n"
printf "                           Welcome!                                  \n"
printf "              This script installs dotfiles for Mac OS X             \n"
printf "                https://github.com/publicarray/dotfiles              \n"
printf "                                                                     \n"

# OSX-only stuff. Abort if not OSX.
if [[ "$OSTYPE" != darwin* ]]; then
    fail "Your operating system is not supported.\n Exiting."
    return 1
fi

info "If you are on a fresh install than please install all AppStore apps first!"
info "eg. The Unarchiver, Pocket, Airmail2, Sip, Caffine, Spotify, Dash, Memory Diag"

info "\nIt is recommended to them in order:"

# heading "Asking for the administrator privileges"
# sudo -v
# # Keep-alive: update existing `sudo` time stamp until `.osx` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    echo
    # interactive menu from: <http://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script>
    PS3='Please enter your choice or hit Enter to see the list again: '
    options=("Install Xcode Command Line Tools" "Install Homebrew" "Install node.js and npm" "Update Ruby Gems" "Upgrade shell with prezto" "Setup Text Editors" "Setup Firefox" "Setup DNSCrypt" "Setup OS X" "Express Install" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Install Xcode Command Line Tools")
                require_dev_tools
                ;;
            "Install Homebrew")
                require_brew

                if ask "Do you want to install Brew Packages from Brewfile.sh?\nThis will install: htop, wget, ssh-copy-id, git, git-ftp, php70, mcrypt, composer, ruby, youtube-dl, ffmpeg, coreutils and ddrescue" Y; then
                    heading "Installing Homebrew Packages"
                    run_safe brew tap Homebrew/bundle # https://github.com/Homebrew/homebrew-bundle
                    run_safe brew bundle
                    info "Cleaning brew cache"
                    run_safe brew cleanup
                fi
                if ask "Do you want to install GUI apps from Caskfile.sh?\nThis will install: VLC Player, Google Chrome, Firefox, Java, GitHub Desktop, Sublime Text 3, Atom, SourceTree, ImageOptim, CodeKit, AppCleaner, BlockBlock, Onyx, Macpaw-Gemini, Steam, Spotify, Adapter and HandBrake" N; then
                    heading "Installing Applications"
                    run_safe sh Caskfile.sh
                fi

                if ask "Do you want to install Quick-look Plugins?\nThis will install: QLColorCode, QLMarkdown, QuickLookJSON, QLPrettyPatch, QuickLookCSV, BetterZipQL, qlImageSize, WebP, and Suspicious Package" Y; then
                    heading "Installing Quick-look Plugins"
                    info "https://github.com/sindresorhus/quick-look-plugins"
                    install_quicklook_plugins
                fi

                echo
                ;;
            "Install node.js and npm")
                require_node

                if ask "Do you want to install global packages with yarn?\n This will install: bower, gulp, pm2, nodemon, gitjk, eslint, fast-cli, lighthouse, npm-check-updates, npm-check, nsp and speed-test"; then
                    require_brew
                    heading "Installing yarn" # https://yarnpkg.com/

                    run_safe brew install yarn
                    # install packages
                    heading "Installing Packages with Yarn"
                    run_safe yarn global --prefix /usr/local add bower gulp lighthouse
                    run_safe yarn global --prefix /usr/local add nodemon pm2 npm-check-updates npm-check nsp
                    run_safe yarn global --prefix /usr/local add gitjk csslint eslint eslint-plugin-unicorn xo fast-cli speed-test
                fi

                if [[ "$(type -P npm)" ]]; then
                    if ask "Do you want to install global packages with npm?\n This will install: bower, gulp, pm2, nodemon, gitjk, eslint, fast-cli, lighthouse, npm-check-updates, npm-check, nsp and speed-test"; then
                        # install packages
                        heading "Installing NPM Packages"
                        run_safe npm install -g bower gulp lighthouse #yo
                        run_safe npm install -g nodemon pm2 npm-check-updates npm-check nsp
                        run_safe npm install -g gitjk csslint eslint eslint-plugin-unicorn xo fast-cli speed-test
                    fi
                fi
                echo
                ;;
            "Update Ruby Gems")
                update_gems
                heading "Installing Gems"
                run_safe gem install bundler
                if [ ! -f /usr/local/bin/istats ]; then
                    if ask "Would you like to install iStats access information about your Mac temperature and fan speed?"; then
                        heading "Installing iStats..."
                        info "sudo gem install iStats -n/usr/local/bin\n"
                        run_safe sudo gem install iStats -n/usr/local/bin
                    fi
                fi
                echo
                ;;
            "Upgrade shell with prezto")
                install_shell
                echo
                ;;
            "Setup Text Editors")
                # Install sublime text packages
                setup_sublime

                # Install atom.io packages
                setup_atom

                # Install nano syntax highlighting
                setup_nano

                ;;
            "Setup Firefox")
                setup_firfox
                ;;
            "Setup DNSCrypt")
                setup_DNSCrypt
                ;;
            "Setup OS X")
                setup_osx
                ;;
            "Express Install")
                require_dev_tools
                require_brew
                heading "Installing Homebrew Packages"
                run_safe brew tap Homebrew/bundle
                run_safe brew bundle
                heading "Installing GUI Applications"
                run_safe sh Caskfile.sh
                info "Cleaning brew cache"
                run_safe brew cleanup
                require_node
                heading "Installing Packages with Yarn"
                run_safe brew install yarn
                run_safe yarn global --prefix /usr/local add bower gulp nodemon pm2 npm-check-updates
                run_safe yarn global --prefix /usr/local add npm-check nsp gitjk fast-cli speed-test
                update_gems
                heading "Installing Gems"
                run_safe gem install bundler
                install_shell
                setup_sublime
                setup_atom
                setup_nano
                setup_firfox
                setup_DNSCrypt
                install_quicklook_plugins
                setup_osx
                success
                ;;
            "Quit")
                break
                ;;
            *) echo invalid option;;
        esac
    done

heading "Done!"
