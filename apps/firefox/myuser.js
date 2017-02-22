/******************************************************************************
 * Publicarray's Custom Settings - add the contents of this file              *
 *                                 to the bottom of the user.js               *
 *                                                                            *
 ******************************************************************************/
// [my comments are in square brackets]

/****** Firefox Sync ******/

user_pref("services.sync.engine.history", false);
user_pref("services.sync.engine.passwords", false);
user_pref("services.sync.engine.prefs.modified", false);
user_pref("services.sync.engine.tabs", false);
user_pref("services.sync.prefs.sync.extensions.ublock0.cloudStorage.myFiltersPane", true);
user_pref("services.sync.prefs.sync.extensions.ublock0.cloudStorage.myRulesPane", true);
user_pref("services.sync.prefs.sync.extensions.ublock0.cloudStorage.tpFiltersPane", true);
user_pref("services.sync.prefs.sync.extensions.ublock0.cloudStorage.whitelistPane", true);

/****** Extensions ******/
user_pref("extensions.ublock0.popupFirewallPane", "true");

user_pref("extensions.smart-referer.mode","direct");
user_pref("extensions.smart-referer.whitelist", "");
user_pref("extensions.smart-referer.allow", "*.dev>* *.disqus.com disqus.com api.solvemedia.com typekit.com *.typekit.com typekit.net *.typekit.net code.google.com>*.googlecode.com 2x2tv.ru>rutube.ru *.abczdrowie.pl>*.wp.pl abczdrowie.pl>*.wp.pl *.baidu.com>*.bdimg.com baidu.com>*.bdimg.com *.dm5.com>*.cdndm5.com dm5.com>*.cdndm5.com drive.google.com>youtube.googleapis.com *.hktvmall.com>*.hktvmall.com *.hktvmall.com>14.198.2*.* login.live.com>* tiles.lyrk.org pokelocate.io>s3.amazonaws.com *>*.postfinance.ch streamcomplet.com>media.vimple.me *.sofort.com *.sofortueberweisung.de tushkan.net>*.hyevo.net *.tushkan.net>*.hyevo.net *>cloud.typography.com videoweed.es>*.coolcdn.ch *.videoweed.es>*.coolcdn.ch novamov.com>*.coolcdn.ch *.novamov.com>*.coolcdn.ch *>*.vivocha.com *>vivocha.com *.ok.ru>*.mycdn.me ok.ru>*.mycdn.me");

user_pref("extensions.@no-resource-uri-leak.uri.chrome.blocking.enabled", true);

user_pref("extensions.https_everywhere._observatory.popup_shown", true);
user_pref("extensions.https_everywhere.firstrun_context_menu", true);

// [I need to be able to change the setting in the UI]
// user_pref("extensions.CanvasBlocker@kkapsner.de.blockMode","blockReadout");

user_pref("extensions.ssleuth.ui.urlbar.colorize", true);

// user_pref("extensions.agentSpoof.acceptDefault", true);
// user_pref("extensions.agentSpoof.acceptEncoding", true);
// user_pref("extensions.agentSpoof.acceptLang", true);
// user_pref("extensions.agentSpoof.acceptLangChoice", "en-US");
// user_pref("extensions.agentSpoof.authorization", false);
// user_pref("extensions.agentSpoof.canvas", false);
// user_pref("extensions.agentSpoof.disableRef", true);
// user_pref("extensions.agentSpoof.ifnone", true);
// user_pref("extensions.agentSpoof.limitTab", false);
// user_pref("extensions.agentSpoof.screenSize", "1366x768");
// user_pref("extensions.agentSpoof.scriptInjection", true);
// user_pref("extensions.agentSpoof.timeInterval", "none");
// user_pref("extensions.agentSpoof.tzOffset", "0");
// user_pref("extensions.agentSpoof.uaChosen", "default");
// user_pref("extensions.agentSpoof.via", false);
// user_pref("extensions.agentSpoof.windowName", true);
// user_pref("extensions.agentSpoof.xff", false);

/******************************************************************************
 * ghacks-user.js - Modifications                                             *
 * https://github.com/ghacksuserjs/ghacks-user.js                             *
 ******************************************************************************/

// 0301: browser auto update
user_pref("app.update.enabled", true);
user_pref("app.update.silent", true);
user_pref("app.update.staging.enabled", true);
// 0302
user_pref("app.update.auto", true);

// 0304: auto update extensions
user_pref("extensions.update.enabled", true);
// 0305:
user_pref("extensions.update.autoUpdateDefault", true);

// 0380:
user_pref("services.sync.enabled", true); // (hidden pref)

// 0410: disable safe browsing
   // I have redesigned this sub-section to differentiate between "real-time"/"user initiated"
   // data being sent to Google from all other settings such as using local blocklists/whitelists
   // and updating those lists. There SHOULD be NO privacy issues here. Even *IF* an URL was sent
   // to Google, they swear it is anonymized and only used to flag malicious sites/activity. Firefox
   // also takes measures such as striping out identifying parameters and storing safe browsing
   // cookies in a separate jar. (#Turn on browser.safebrowsing.debug to monitor this activity)
   // To use safebrowsing but not "leak" binary download info to Google, only use 0410e and 0410f
   // #Required reading: https://feeding.cloud.geek.nz/posts/how-safe-browsing-works-in-firefox/
   // https://wiki.mozilla.org/Security/Safe_Browsing
// 0410a: disable "Block dangerous and deceptive content" This setting is under Options>Security
   // in FF47 and under this is was titled "Block reported web forgeries"
   // this covers deceptive sites such as phishing and social engineering
user_pref("browser.safebrowsing.malware.enabled", true);
user_pref("browser.safebrowsing.phishing.enabled", true); // (FF50+)
// 0410b: disable "Block dangerous downloads" This setting is under Options>Security
   // in FF47 and under this was titled "Block reported attack sites"
   // this covers malware and PUPs (potentially unwanted programs)
user_pref("browser.safebrowsing.downloads.enabled", true);
   // disable "Warn me about unwanted and uncommon software" Also under Options>Security (FF48+)
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", true);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);
   // yet more prefs added (FF49+)
user_pref("browser.safebrowsing.downloads.remote.block_dangerous", true);
user_pref("browser.safebrowsing.downloads.remote.block_dangerous_host", true);
// 0410c: disable Google safebrowsing downloads, updates
user_pref("browser.safebrowsing.provider.google.updateURL", "https://safebrowsing.google.com/safebrowsing/downloads?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2&key=%GOOGLE_API_KEY%"); // update google lists
user_pref("browser.safebrowsing.provider.google.gethashURL", "https://shavar.services.mozilla.com/gethash?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2"); // list hash check
user_pref("browser.safebrowsing.provider.google4.updateURL", "https://safebrowsing.googleapis.com/v4/threatListUpdates:fetch?$ct=application/x-protobuf&key=%GOOGLE_API_KEY%"); // (FF50+)
// user_pref("browser.safebrowsing.provider.google4.gethashURL", ""); // (FF50+)
// 0410d: disable mozilla safebrowsing downloads, updates
   // NOTE: These two prefs are also used for Tracking Protection (see 0420)
user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "https://shavar.services.mozilla.com/gethash?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2"); // resolves hash conflicts
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "https://shavar.services.mozilla.com/downloads?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&pver=2.2"); // update FF lists


// 0812: disable search and form history
   // Under Options>Privacy> if you set Firefox to "use custom settings" there will be a
   // setting called "remember search and form history".
   // You can clear formdata on exiting Firefox (see 2803)
   user_pref("browser.formfill.enable", false);
// 0813: disable saving form data on secure websites - PRIVACY (shoulder surfers etc)
   // For convenience & functionality, this is best left at default true.
   // You can clear formdata on exiting Firefox (see 2803)
   user_pref("browser.formfill.saveHttpsForms", false);
// 0816: disable browsing and download history
   // Under Options>Privacy> if you set Firefox to "use custom settings" there will be a
   // setting called "remember my browsing and download history"
   // You can clear history and downloads on exiting Firefox (see 2803)
   user_pref("places.history.enabled", false);
// 0901: disable saving passwords
   // Options>Security>Logins>Remember logins for sites
   // NOTE: this does not clear any passwords already saved
   user_pref("signon.rememberSignons", false); // [Please use a password manager instead]
// 1012: disable resuming session from crash [personal preference]
// user_pref("browser.sessionstore.resume_from_crash", true);
// 1209: control TLS versions with min and max
   // 1=min version of TLS 1.0, 2-min version of TLS 1.1, 3=min version of TLS 1.2 etc
   // WARNING: FF/chrome currently allow TLS 1.0 by default, so this is your call.
   // http://kb.mozillazine.org/Security.tls.version.*
   // https://www.ssl.com/how-to/turn-off-ssl-3-0-and-tls-1-0-in-your-browser/
   user_pref("security.tls.version.min", 2);
   // user_pref("security.tls.version.fallback-limit", 3); // [default 3]
   // user_pref("security.tls.version.max", 4); // allow up to and including TLS 1.3 // [default 4]
// 1217: disable insecure passive content (such as images) on https pages - mixed context
   // current default=false, leave it this way as too many sites break visually
   user_pref("security.mixed_content.block_display_content", true);
// 1220: disable intermediate certificate caching (fingerprinting attack vector)
   // NOTE: This affects login/cert/key dbs. AFAIK the only effect is all active logins start anew
   // per session. This may be better handled under FPI (ticket 1323644, part of Tor Uplift)
   // https://bugzilla.mozilla.org/show_bug.cgi?id=1334485 // related bug
   // https://bugzilla.mozilla.org/show_bug.cgi?id=1216882 // related bug (see comment 9)
   // [https://www.bleepingcomputer.com/news/security/firefox-users-fingerprinted-via-cached-intermediate-https-certificates/]
   // demo: [https://fiprinca.0x90.eu/poc/]
   // user_pref("security.nocertdb", true); // (hidden pref)
// 1405: disable woff2
// [use uBlock for more control: https://github.com/gorhill/uBlock/wiki/Per-site-switches#no-remote-fonts]
user_pref("gfx.downloadable_fonts.woff2.enabled", true); // [Why not?]
// 1603: referer, WHEN to send
   // [http://kb.mozillazine.org/Network.http.sendRefererHeader]
   // [https://github.com/ghacksuserjs/ghacks-user.js/issues/5#issuecomment-280867769]
   // 0=never, 1=send only when links are clicked, 2=for links and images (default)
   user_pref("network.http.sendRefererHeader", 1); // [1 can course hot-linking issues/warnings]
// 1604: referer, SPOOF or NOT (default=false) [caution: can beak websites]
   // true=use the target URI instead
   user_pref("network.http.referer.spoofSource", false);
// 1605: referer, HOW to handle cross origins
   // 0=always (default), 1=only if base domains match, 2=only if hosts match
   user_pref("network.http.referer.XOriginPolicy", 2);
// 1606: referer, WHAT to send (limit the information) [caution: can beak websites]
   // 0=send full URI (default), 1=scheme+host+port+path, 2=scheme+host+port
   // user_pref("network.http.referer.trimmingPolicy", 2);
   // If headers need to be send cross origins, WHAT to send
   // 0=send full URI (default), 1=scheme+host+port+path, 2=scheme+host+port
   // [https://github.com/ghacksuserjs/ghacks-user.js/issues/5#issuecomment-280871726]
   user_pref("network.http.referer.XOriginTrimmingPolicy", 2); // [caution: may beak OAuth 2.0]
// 1802a: make sure a plugin is in a certain state: 0=deactivated 1=ask 2=enabled (Flash example)
   // you can set all these plugin.state's via Add-ons>Plugins or search for plugin.state in about:config
   // NOTE: you can still over-ride individual sites eg youtube via site permissions
   // http://www.ghacks.net/2013/07/09/how-to-make-sure-that-a-firefox-plugin-never-activates-again/
   user_pref("plugin.state.flash", 0);
// 1807: disable auto-play of HTML5 media
   // WARNING: This may break youtube video playback (and probably other sites). If you block
   // autoplay but occasionally would like a toggle button, try the following add-on
   // https://addons.mozilla.org/en-US/firefox/addon/autoplay-toggle
user_pref("media.autoplay.enabled", true); // [Fix for youtube.com]
// 2204: disable links opening in a new window
   // https://trac.torproject.org/projects/tor/ticket/9881
   // test url: https://people.torproject.org/~gk/misc/entire_desktop.html
   // You can still right click a link and select open in a new window
   // This is to stop malicious window sizes and screen res leaks etc in conjunction
   // with 2203 dom.disable_window_move_resize=true | 2418 full-screen-api.enabled=false
   user_pref("browser.link.open_newwindow.restriction", 0);
// 2301: disable workers API and service workers API
   // https://developer.mozilla.org/en-US/docs/Web/API/Worker
   // https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorker_API
   // http://www.ghacks.net/2016/03/02/manage-service-workers-in-firefox-and-chrome/
   // WARNING: WILL break sites as this gains traction: eg mega.nz requires workers
// user_pref("dom.workers.enabled", false); [need to investigate, disabled for now]
// user_pref("dom.serviceWorkers.enabled", false);
// 2302: disable service workers cache and cache storage
// user_pref("dom.caches.enabled", false);
// 2418: disable full-screen API
   // This setting WAS under about:permissions>All Sites>Fullscreen
   // NOTE: about:permissions is no longer available since FF46 but you can still override
   // individual domains: use info icon in urlbar etc or right click on a web page>view page info
   // set to false=block, set to true=ask
user_pref("full-screen-api.enabled", true); // [Fix for full screen video (e.g. youtube)]
// 2508: disable graphics fingerprinting (the loss of hardware acceleration is negligible)
   // These prefs are under Options>Advanced>General>Use hardware acceleration when available
   // NOTE: changing this option changes BOTH these preferences
   // https://wiki.mozilla.org/Platform/GFX/HardwareAcceleration
   // WARNING: This changes text rendering (fonts will look different)
   //          If you watch a lot of video, this will impact performance
// user_pref("gfx.direct2d.disabled", false); // Need to investigate
// user_pref("layers.acceleration.disabled", false);
// 2614: disable SPDY as it can contain identifiers
   // https://www.torproject.org/projects/torbrowser/design/#identifier-linkability (no. 10)
user_pref("network.http.spdy.enabled", true); // [needed for http/2 to work]
// user_pref("network.http.spdy.enabled.deps", false);
// 2615: disable http2 for now as well
user_pref("network.http.spdy.enabled.http2", true); // [sorry, but I <3 http/2]
// 2617: disable pdf.js as an option to preview PDFs within Firefox
   // see mime-types under Options>Applications) - EXPLOIT risk
   // Enabling this (set to true) will change your option most likely to "Ask" or "Open with
   // some external pdf reader". This does NOT necessarily prevent pdf.js being used via
   // other means, it only removes the option. I think this should be left at default (false).
   // 1. It won't stop JS bypassing it. 2. Depending on external pdf viewers there is just as
   // much risk or more (acrobat). 3. Mozilla are very quick to patch these sorts of exploits,
   // they treat them as severe/critical and 4. for convenience
user_pref("pdfjs.disabled", false); // [I'm 50:50 with this. I think pdf.js has less of chance of infecting the machine than the preview.app]
// 2627: Spoof default UA & relevant (navigator) parts (also see 0204 for UA language)
   // NOTE: may be better handled by an extension (eg whitelisitng), try not to clash with it
   // NOTE: this is NOT a complete solution (feature detection, some navigator objects leak, resource URI etc)
   // AIM: match latest TBB settings: Windows, ESR, OS etc
   // WARNING: If you do not understand fingerprinting then don't use this section
   // test: http://browserspy.dk/browser.php
   //       http://browserspy.dk/showprop.php (for buildID)
   //       http://browserspy.dk/useragent.php
   // ==start==
   // A: navigator.userAgent leaks in JS, setting this also seems to break UA extension whitelisting
   // [match the rest of the user agent properties]
   user_pref("general.useragent.override", "Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0"); // (hidden pref)
                                        // Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0 [Tor]
                                        // Mozilla/5.0 (Windows NT 6.1; rv:51.0) Gecko/20100101 Firefox/51.0 [current FF]
                                        // Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0 [Windows 10, 64bit, v51]
   // C: navigator.appName
  // user_pref("general.appname.override", "Netscape"); // (hidden pref)
   // D: navigator.appVersion
  // user_pref("general.appversion.override", "5.0 (Windows)"); // (hidden pref)
   // E: navigator.platform leaks in JS
  // user_pref("general.platform.override", "Win32"); // (hidden pref)
   // F: navigator.oscpu
  // user_pref("general.oscpu.override", "Windows NT 6.1"); // (hidden pref)

// 2671: disable SVG (FF53+)
   // https://bugzilla.mozilla.org/show_bug.cgi?id=1216893
user_pref("svg.disabled", false); // [beaks too many icons. fix for github.com and youtube.com]
/*** 2698: FIRST PARTY ISOLATION (PFI) ***/
// 2698a: enable first party isolation pref and OriginAttribute (FF51+)
   // WARNING: breaks lots of cross-domain logins and site funtionality until perfected
   // https://bugzilla.mozilla.org/show_bug.cgi?id=1260931
// 2698b: this also isolates OCSP requests by first party domain
   // https://bugzilla.mozilla.org/show_bug.cgi?id=1264562
   user_pref("privacy.firstparty.isolate", true); // [let's test if it blows up in my face]
// 2701: disable cookies on all sites
   // you can set exceptions under site permissions or use an extension (eg Cookie Controller)
   // http://kb.mozillazine.org/Network.cookie.cookieBehavior
   // 0=allow all 1=allow same host 2=disallow all 3=allow 3rd party if it already set a cookie
   // [2 is too restrictive, fix: twitter login. Setting also impacts local storage and indexedDB.
   // The problem was that that selectively allowing cookies for Twitter did not allow indexedDB. Twitter needs indexedDB for login]
user_pref("network.cookie.cookieBehavior", 1);
// 2706: disable Storage API (FF51+) which gives sites' code the ability to find out how much space
   // they can use, how much they are already using, and even control whether or not they need to
   // be alerted before the user agent disposes of site data in order to make room for other things.
   // https://developer.mozilla.org/en-US/docs/Web/API/StorageManager
   // https://developer.mozilla.org/en-US/docs/Web/API/Storage_API
// user_pref("dom.storageManager.enabled", true); // [Use an extension like "Self-Destructing Cookies"]
// 2703: set cookie lifetime policy
   // 0=until they expire (default), 2=until you close Firefox, 3=for n days (see next pref)
   // If you use custom settings for History in Options, this is the setting under
   // Privacy>Accept cookies from sites>Keep until <they expire/I close Firefox>
   // user_pref("network.cookie.lifetimePolicy", 2); // use extension
// 2804a: include all open windows/tabs when you run clear recent history
   user_pref("privacy.cpd.openWindows", true);

// 9999: TO INVESTIGATE - OTHER //
// 3000's: show system add-ons in about:addons (so you can enable/disable them) - NOT landed yet
   // https://bugzilla.mozilla.org/show_bug.cgi?id=1231202
    user_pref("extensions.hideSystemAddons", false); // (hidden pref)

// 3000: PERSONAL SETTINGS //
// 3002: disable closing browser with last tab
user_pref("browser.tabs.closeWindowWithLastTab", true); // [I'm on a mac and prefer the apple way]
// 3009: turn on APZ (Async Pan/Zoom) - requires e10s
   // http://www.ghacks.net/2015/07/28/scrolling-in-firefox-to-get-a-lot-better-thanks-to-apz/
   user_pref("layers.async-pan-zoom.enabled", true);
// 3012: spellchecking: 0=none, 1-multi-line controls, 2=multi-line & single-line controls
user_pref("layout.spellcheckDefault", 2); // [the more spell checking the better]

/******************************************************************************
 * user.js - Additions                                                        *
 * https://github.com/pyllyukko/user.js                                       *
 ******************************************************************************/

// disable Gnome Shell Integration
// user_pref("plugin.state.libgnome-shell-browser-plugin",     0);

// https://developer.mozilla.org/en-US/docs/Tools/Remote_Debugging/Debugging_Firefox_Desktop#Firefox_37_onwards
user_pref("devtools.debugger.force-local",          true);

// CSP https://developer.mozilla.org/en-US/docs/Web/Security/CSP/Introducing_Content_Security_Policy
// [already enabled by default]
// user_pref("security.csp.enable",                true);

// https://bugzilla.mozilla.org/show_bug.cgi?id=855326 [personal preference]
user_pref("security.csp.experimentalEnabled",           true);

// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.6 Enable IDN Show Punycode
// http://kb.mozillazine.org/Network.IDN_show_punycode
user_pref("network.IDN_show_punycode",              true);


// CIPHERS
// [most recent version of FF will have releasable secure ciphers by default]

/******************************************************************************
 * My own preferences and overrides                                           *
 ******************************************************************************/

// ** [Startup] ** //
// Start with 0 = blank page, 1 = home page, 3 = last session
// http://kb.mozillazine.org/Browser.startup.page
user_pref("browser.startup.page", 0);
// [set home page]
user_pref("browser.startup.homepage", "about:newtab");
// [I don't see any harm because it is a blank page anyway]
user_pref("browser.newtab.preload", true);

// [disable annoying notifications]
user_pref("browser.feeds.showFirstRunUI", false);
user_pref("browser.reader.detectedFirstArticle", true);
user_pref("browser.customizemode.tip0.shown", true);

// [Java plugin state - never activate]
user_pref("plugin.state.java", 0);
user_pref("plugin.state.npdeployjava1", 0);

// ** [HTML/JS] ** //
// disable JS ability to hide bookmarks toolbar
user_pref("dom.disable_window_open_feature.directories", true);

// [use global zoom]
user_pref("browser.zoom.siteSpecific", false);

// ** [Browser] ** //
// Downloading to Downloads folder
// 0 = desktop, 1 = Downloads folder, 2 = most recently used location
user_pref("browser.download.folderList", 1);

// use download folder above (true) or ask where to save the file (false)
// https://developer.mozilla.org/en/Download_Manager_preferences
user_pref("browser.download.useDownloadDir", true);

// [WebGL - only when absolutely needed]
// user_pref("webgl.disabled", false);
// user_pref("pdfjs.enableWebGL", false);
// user_pref("webgl.min_capability_mode", true);
// user_pref("webgl.disable-extensions", true);
// 2012: two more webgl preferences (FF51+)
// user_pref("webgl.dxgl.enabled", false);
// user_pref("webgl.enable-webgl2", false);

// [Match closer to existing FF support]
// user_pref("media.ogg.enabled", true);
// user_pref("media.ogg.flac.enabled", true); // (FF51+)
// user_pref("media.opus.enabled", true);

// [GeoLocation (google maps) - risk of physical security]
// http://www.mozilla.org/en-US/firefox/geolocation/
// user_pref("geo.enabled", true);

// [auto-complete bookmarks (warning shoulder surfers can read them too)]
// http://kb.mozillazine.org/Browser.urlbar.default.behavior
user_pref("browser.urlbar.default.behavior", 58); // bookmarks only (2 bookmarks + 8 title + 16 URL + 32 typed)
user_pref("browser.urlbar.autocomplete.enabled", true); // needed to show bookmarks
user_pref("browser.urlbar.maxRichResults", 6); // number of entries to show in the drop down
user_pref("keyword.enabled", true); // enable search in URLbar

user_pref("ghacks_user.js.parrot", "9999 syntax error: The parrot is alive! Nope. I lied. The parrot is in heaven.");

