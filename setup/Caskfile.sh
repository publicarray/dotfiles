. functions.sh

# Install Cask
brew tap caskroom/versions
brew install caskroom/cask/brew-cask

# upgrade already installed casks
brew upgrade brew-cask

# Core Functionality
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" opera
brew cask install --appdir="/Applications" skype
brew cask install java
brew cask install flash-player

# Development
brew cask install --appdir="/Applications" github
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" sourcetree
brew cask install --appdir="/Applications" cyberduck
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" codekit # needs licence
brew cask install --appdir="/Applications" mamp
# brew cask install --appdir="/Applications" dash # available via appstore
# brew cask install --appdir="/Applications" virtualbox # If you want it

# Utility
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" desktoputility
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" macpaw-gemini # needs licence
brew cask install --appdir="/Applications" togglDesktop
# brew cask install --appdir="/Applications" caffeine # available via appstore

# Games
brew cask install --appdir="/Applications" minecraft # needs licence
brew cask install --appdir="/Applications" steam

# Music/Video
brew cask install --appdir="/Applications" rdio
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" adapter
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" burn

# Productivity
brew cask install --appdir="/Applications" hipchat
brew cask install --appdir="/Applications" teamviewer
# brew cask install --appdir="/Applications" slack # available via appstore

# Quick look Plug-ins from: https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json betterzipql quicklook-csv qlimagesize suspicious-package

# clean-up
info "Cleaning brew-cask cache"
brew cask cleanup
