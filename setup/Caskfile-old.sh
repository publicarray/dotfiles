. functions.sh

# Install Cask
# brew tap caskroom/cask
# brew tap caskroom/versions
# brew tap caskroom/fonts
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Core
brew cask install vlc
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox
brew cask install firefoxnightly
# brew cask install vivaldi
brew cask install torbrowser

# Development
brew cask install sublime-text3 # the very best and fastest code editor
brew cask install visual-studio-code # next gen code editor
# brew cask install atom # (too slow)
brew cask install gitup # the absolute best git Gui for mac
brew cask install p4merge # merge, diff and resolve git conflicts
# brew cask install github-desktop
# brew cask install sourcetree
# brew cask install cyberduck
# brew cask install filezilla
brew cask install imageoptim
brew cask install codekit # needs licence
# brew cask install mamp
brew cask install java
brew cask install sequel-pro # view mysql database
brew cask install postgres
brew cask install owasp-zap # pen test web apps
# brew cask install dash # available via the appstore
# brew cask install virtualbox
brew cask install docker

# Utility
# brew cask install flux
brew cask install appcleaner # clean up after app uninstall
brew cask install spectacle # resize apps to maximise desktop space
brew cask install macpaw-gemini # needs licence
brew cask install blockblock # security app - warns about demons or agents that install themselves permanently
brew cask install onyx # mac utility toolbox
brew cask install gpgtools # pgp key management
# brew cask install keybase
brew cask install cryptomator
# brew cask install togglDesktop
# brew cask install caffeine # available via the appstore
brew cask install taskexplorer
brew cask install knockknock
brew cask install etrecheck # generate a mac status report to debug problems
brew cask install viscosity # needs licence
brew cask install paw # http api,  needs licence
brew cask install keka # unzip 7zip

# Games
# brew cask install minecraft # needs licence
brew cask install steam

# Music/Video
brew cask install spotify
brew cask install adapter
brew cask install handbrake
brew cask install burn

# Productivity
brew cask install utox
# brew cask install pushpal
# brew cask install skype
# brew cask install hipchat
# brew cask install teamviewer
# brew cask install slack # available via the appstore

# clean-up
info "Cleaning brew-cask cache"
brew cask cleanup
