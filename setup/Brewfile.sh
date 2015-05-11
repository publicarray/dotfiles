. functions.sh

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install wget
brew install git
brew install git-ftp
brew install php56
brew install mcrypt php56-mcrypt
brew install composer
# brew install node #alternatives to install via http://nodejs.org/ or nvm (node version manager)
# brew install zsh

# optional:
# brew install homebrew/dupes/tidy # installs htmltidy
# brew install ruby
# brew install python
# brew install heroku-toolbelt
# brew install aws-elasticbeanstalk
# brew install php56-pdo-pgsql
# brew install sqlite
# brew install ffmpeg
# brew install curl
# brew install libdvdcss
# brew install postgresql
# brew install awscli
# brew install cmake
# brew install php56-xcache

# clean-up
info "Cleaning brew cache"
brew cleanup
