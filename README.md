Screenshot
----------
![](https://cloud.githubusercontent.com/assets/5497998/7611396/a1da25b6-f9c7-11e4-993c-5c17a30f2d40.png)
![](https://cloud.githubusercontent.com/assets/5497998/7610829/54051caa-f9c3-11e4-93df-e0f361d88d60.png)
Installation
============
1. Run the install script

        bash <(curl -s https://raw.githubusercontent.com/publicarray/dotfiles/master/install.sh)

2. Install my Terminal Theme

    Download and open the [publicarray.terminal](publicarray.terminal) file.
    To make it permanent remember to set it as your default.

3. Get a better colour picker

    I recommend [skalacolor](http://bjango.com/mac/skalacolor/).

Configuring
-----------------
For prezto configuration files see [prezto/runcoms](https://github.com/sorin-ionescu/prezto/tree/master/runcoms#configuration-files).

To add any aliases, exports, functions and shell options. I recommend you add them to `.zshrc` for zsh and `bashrc` for bash.

If you use Atom and you get the following waring:

>The linter 'shellcheck' cannot be found

Than you should open your terminal and execute `which shellcheck`. Than copy the output path into the shellcheck preferences as the Executable path.
e.g. `/usr/local/bin/shellcheck`.

Influences
----------
https://github.com/travi/dotfiles

https://github.com/paulmillr/dotfiles

https://bitbucket.org/rjchatfield/dotfiles
