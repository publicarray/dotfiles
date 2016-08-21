. functions.sh

# Install Cask
# brew tap caskroom/cask
# brew tap caskroom/versions
# brew tap caskroom/fonts
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Core
brew cask install vlc
brew cask install google-chrome
brew cask install firefox
# brew cask install vivaldi

# Development
brew cask install sublime-text3
brew cask install atom
brew cask install github-desktop
brew cask install sourcetree
# brew cask install cyberduck
# brew cask install filezilla
brew cask install imageoptim
brew cask install codekit # needs licence
# brew cask install mamp
brew cask install java
brew cask install owasp-zap
# brew cask install dash # available via the appstore
# brew cask install virtualbox

# Utility
# brew cask install flux
brew cask install appcleaner
brew cask install spectacle # resize apps to maximise desktop space
brew cask install appcleaner
brew cask install macpaw-gemini # needs licence
brew cask install blockblock # security app - warns about demons or agents that install themselves permanently
brew cask install onyx
# brew cask install togglDesktop
# brew cask install caffeine # available via the appstore

# Games
# brew cask install minecraft # needs licence
brew cask install steam

# Music/Video
brew cask install spotify
brew cask install adapter
brew cask install handbrake
brew cask install burn

# Productivity
# brew cask install skype
# brew cask install hipchat
# brew cask install teamviewer
# brew cask install slack # available via the appstore

# clean-up
info "Cleaning brew-cask cache"
brew cask cleanup
