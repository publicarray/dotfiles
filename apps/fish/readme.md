# Install

[Install Fish](http://fishshell.com)

```sh
brew install fish

# make fish your default shell
sudo sh -c '/usr/local/bin/fish' >> /etc/shells
chsh -s /usr/local/bin/fish
```

[Install Fisherman](https://github.com/fisherman/fisherman)

```sh
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
```

Install plug-ins and [prompt](https://github.com/publicarray/pure)

```sh
cp ~/.dotfiles/fish/fishfile ~/.config/fish/fishfile 
cp ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish 
fisher
fish_update_completions
fisher publicarray/pure
```

# [Install micro - a modern text editor](https://github.com/zyedidia/micro)

```sh
brew install micro
set -U EDITOR micro
set -U VISUAL micro
```

## other

```sh
brew install archey
set -U HOMEBREW_NO_ANALYTICS 1
```
