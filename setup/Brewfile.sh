# upgrade already installed homebrew packages
brew upgrade

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install wget
brew install zsh
brew install git
brew install git-ftp
brew install php56
brew install mcrypt php56-mcrypt
brew install composer
brew install heroku-toolbelt
brew install aws-elasticbeanstalk
# brew install node #recommend to install via http://nodejs.org/

# clean-up
brew cleanup