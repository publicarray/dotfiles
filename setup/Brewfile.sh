. functions.sh

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install wget
brew install git
brew install git-ftp
brew install ruby
brew install python
brew install php56
brew install mcrypt php56-mcrypt
brew install composer
brew install homebrew/dupes/tidy # installs htmltidy
brew install node #alternatives to install via http://nodejs.org/ or nvm (node version manager)

# optional:
# brew install heroku-toolbelt
# brew install aws-elasticbeanstalk

# clean-up
info "Cleaning brew cache"
brew cleanup
