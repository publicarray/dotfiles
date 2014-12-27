#!/bin/bash
alias zshconfig="sublime ~/.zshrc; sublime ~/.zprofile; sublime ~/.zshenv; sublime ~/.zpreztorc"
alias bashconfig="sublime ~/.bash_profile; sublime ~/.bashrc"
alias gitconfig="sublime ~/.gitconfig; sublime ~/.gitignore_global"
alias slt="sublime"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0;ipconfig getifaddr en1;"
alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias afk="open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"