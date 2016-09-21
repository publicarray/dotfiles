. functions.sh

brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install homebrew/completions/brew-cask-completion

brew install htop
brew install wget
brew install ssh-copy-id
brew install git
brew install hub # github -> https://hub.github.com/
brew install bfg
brew install git-ftp
brew install nmap
brew install p7zip
brew install coreutils
brew install ddrescue # http://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html
brew install ffmpeg
brew install youtube-dl
brew install php70
brew install php70-mcrypt
brew install composer
brew install ruby

# optional:
# brew install homebrew/dupes/tidy # installs htmltidy
# brew install python
# brew install heroku-toolbelt
# brew install aws-elasticbeanstalk
# brew install php56-pdo-pgsql
# brew install sqlite
# brew install curl
# brew install libdvdcss
# brew install postgresql
# brew install awscli
# brew install cmake

# clean-up
info "Cleaning brew cache"
brew cleanup
