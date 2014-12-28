#Install Cask
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
brew cask install --appdir="/Applications" codekit # need licence
brew cask install --appdir="/Applications" mamp
brew cask install node # can be installed with Homebrew
# brew cask install heroku-toolbelt # installed via brew

# Utility
# brew cask install --appdir="/Applications" caffeine # can be installed via appstore
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" desktoputility
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" macpaw-gemini # need licence
brew cask install --appdir="/Applications" togglDesktop
# brew cask install --appdir="/Applications" virtualbox # I don't use it

# Games
brew cask install --appdir="/Applications" minecraft # need licence
brew cask install --appdir="/Applications" steam

# Music/Video
brew cask install --appdir="/Applications" rdio
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" adapter
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" burn

# clean-up
brew cask cleanup
