# Alias
alias dotfiles="subl -n ~/.dotfiles"
alias dotfiles-remove='~/.dotfiles/setup/remove.sh'
alias dotfiles-install='~/.dotfiles/setup/install.sh'
alias shellconfig='subl ~/.usershell'
alias fishconfig='subl ~/.config/fish'
alias zshconfig='subl ~/.zshrc; subl ~/.zprofile; subl subl ~/.zlogin; subl ~/.zlogout'
alias preztoconfig='subl ~/.zpreztorc; subl ~/.zshenv; subl ~/.zprofile; subl ~/.zshrc; subl ~/.zshenv; subl ~/.zlogin; subl ~/.zlogout'
alias bashconfig='subl ~/.bash_profile; subl ~/.bashrc'
alias gitconfig='subl ~/.gitconfig; subl ~/.gitignore_global'
alias slt='subl'
alias c='clear'
alias wget='wget -c' # Resume wget by default
alias path='echo $PATH\n'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias localip='ipconfig getifaddr en0;ipconfig getifaddr en1;'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myip='publicip'
alias pubip='publicip'
alias rm='rm -i'
alias ll='ls -lh'
alias l.='ls -d -G .*'
alias npml='npm list -g --depth=0'
alias brewl='brew leaves'
alias afk="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias sleeping="pmset sleepnow"
alias hideDesktop='defaults write com.apple.finder CreateDesktop -bool false; killall Finder;'
alias showDesktop='defaults write com.apple.finder CreateDesktop -bool true; killall Finder;'
alias gitjk="history 10 | tail -r | gitjk_cmd"
alias net='sudo lsof -i -n -P'
alias git='hub'
alias sysinfo='sw_vers'

# DOCKER <https://www.calazan.com/docker-cleanup-commands/>
# Kill all running containers.
alias dockerkillall='docker kill (docker ps -q)'

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" and docker rm (docker ps -a -q)'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" and docker rmi (docker images -q -f dangling=true)'

# Delete all orphaned volumes.
alias dockercleanv='printf "\n>>> Deleting orphaned volumes\n\n" and docker volume rm (docker volume ls -qf dangling=true)'

# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc or true and dockercleani and dockercleanv'
