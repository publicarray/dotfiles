# [My Recommended extensions](https://addons.mozilla.org/en-US/firefox/collections/publicarray/privacy-kit-57/)

[uBlock Origin](https://github.com/gorhill/uBlock) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

[Decentraleyes](https://decentraleyes.org/) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/)

[1password](https://1password.com/downloads/) - [Get the Extension](https://agilebits.com/onepassword/extensions) / [LastPass](https://lastpass.com/) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/lastpass-password-manager/) or any other password manager

[HTTPS Everywhere](https://www.eff.org/https-everywhere) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/)

~~[Cookie-AutoDelete](https://github.com/Cookie-AutoDelete/Cookie-AutoDelete) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/)~~ I've since used a whitelist approach, but I'll leave this here.

[Smart Referer](https://github.com/meh/smart-referer) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/smart-referer/)

[Temporary Containers](https://github.com/stoically/temporary-containers) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/)

[Neat URL](https://github.com/Smile4ever/firefoxaddons) - [Get the Extension](https://addons.mozilla.org/firefox/addon/neat-url/)

[Don't touch my tabs! (rel=noopener)](https://mathiasbynens.github.io/rel-noopener/) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/dont-touch-my-tabs/)

And for those that still use Facebook:

[Facebook Container](https://github.com/mozilla/contain-facebook) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/facebook-container/)

## Additional Extensions

[uBO-Scope](https://github.com/gorhill/uBO-Scope) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/ubo-scope/)

[uMatrix](https://github.com/gorhill/uMatrix) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/umatrix/)

[Request Control](https://github.com/tumpio/requestcontrol) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/requestcontrol/) - [Rules](https://github.com/ghacksuserjs/ghacks-user.js/wiki/3.5-Request-Control)

[Violentmonkey](https://violentmonkey.github.io/) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/) or [Tampermonkey](https://tampermonkey.net/) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/) 
Some Privacy related scripts: https://github.com/ghacksuserjs/ghacks-user.js/wiki/3.1-User-Scripts. For those that use the AAK-Cont list in uBlockOrigin I recommend installing the companion user-script: https://xuhaiyang1234.gitlab.io/AAK-Cont/

<!-- [SSleuth](https://github.com/sibiantony/ssleuth/) - [Get the Extension](https://addons.mozilla.org/en-US/firefox/addon/ssleuth/) -->

## [Also see ghacks-user.js/wiki/Appendix-B:-Extensions](https://github.com/ghacksuserjs/ghacks-user.js/wiki/Appendix-B:-Extensions)

# User.js (Out-of-date instructions)

Install/update user.js with wget on MacOS

```sh
cd (find ~/Library/Application\ Support/Firefox/Profiles/ -maxdepth 1 -type d -name '*.default')
wget https://raw.githubusercontent.com/ghacksuserjs/ghacks-user.js/master/user.js
wget https://raw.githubusercontent.com/publicarray/dotfiles/master/apps/firefox/myuser.js -O user-overrides.js
cat user-overrides.js >> user.js
```

Update user.js with git on MacOS

```sh
cd (find ~/Library/Application\ Support/Firefox/Profiles/ -maxdepth 1 -type d -name '*.default')
git fetch
git checkout origin/master -- user.js
cat user-overrides.js >> user.js
```
