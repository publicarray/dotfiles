Installation
============
1. Run the install script

        bash <(curl -s https://raw.githubusercontent.com/publicarray/dotfiles/master/install.sh)

2. Set Path Variable

        export PATH="$/opt/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

File Descriptions
-----------------

### zshenv

This file is sourced by all instances of Zsh, and thus, it should be kept as
small as possible and should only define environment variables.

### zprofile

This file is similar to zlogin, but it is sourced before zshrc. It was added
for [KornShell][1] fans. See the description of zlogin below for what it may
contain.

zprofile and zlogin are not meant to be used concurrently but can be done so.

### zshrc

This file is sourced by interactive shells. It should define aliases,
functions, shell options, and key bindings.

### zpreztorc

This file configures Prezto.

### zlogin

This file is sourced by login shells after zshrc, and thus, it should contain
commands that need to execute at login. It is usually used for messages such as
[fortune][2], [msgs][3], or for the creation of files.

This is not the file to define aliases, functions, shell options, and key
bindings. It should not change the shell environment.

### zlogout

This file is sourced by login shells during logout. It should be used for
displaying messages and the deletion of files.

Influences
----------
https://github.com/sorin-ionescu/prezto
https://github.com/travi/dotfiles
https://github.com/paulmillr/dotfiles
