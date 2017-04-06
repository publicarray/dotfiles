# Install

[Install Fish](http://fishshell.com)

```sh
brew install fish

# make fish your default shell
which fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

[Install Fisherman](https://github.com/fisherman/fisherman)

```sh
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
```

Install plug-ins and [prompt](https://github.com/publicarray/pure)

```sh
cp ~/.dotfiles/apps/fish/fishfile ~/.config/fish/fishfile
cp ~/.dotfiles/apps/fish/config.fish ~/.config/fish/config.fish 
fisher
fish_update_completions
```

[Install micro - a modern text editor](https://github.com/zyedidia/micro)

```sh
brew install micro
set -U EDITOR micro
set -U VISUAL $EDITOR
```

## dependencies for all features

```sh
# set -U HOMEBREW_NO_ANALYTICS 1
brew install z thefuck hub archey composer php71
gem install bundler
```
