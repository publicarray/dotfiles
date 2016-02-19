/******************************************************************************
 * Publicarray's Custom Settings - add the contents of this file              *
 *                                 to the bottom of the user.js               *
 *                                                                            *
 ******************************************************************************/

// https://github.com/pyllyukko/user.js
// http://www.ghacks.net/2016/01/04/the-firefox-privacy-and-security-list-has-been-updated/
// http://www.ghacks.net/2015/08/18/a-comprehensive-list-of-firefox-privacy-and-security-settings/
// http://12bytes.org/articles/tech/firefoxgecko-configuration-guide-for-privacy-and-performance-buffs#userjs-contents

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

user_pref("extensions.ssleuth.ui.urlbar.colorize", true);

user_pref("extensions.omnisidebar.firstEnabled", false);

user_pref("extensions.agentSpoof.acceptDefault", true);
user_pref("extensions.agentSpoof.acceptEncoding", true);
user_pref("extensions.agentSpoof.acceptLang", true);
user_pref("extensions.agentSpoof.acceptLangChoice", "en-US");
user_pref("extensions.agentSpoof.authorization", false);
user_pref("extensions.agentSpoof.canvas", false);
user_pref("extensions.agentSpoof.disableRef", true);
user_pref("extensions.agentSpoof.ifnone", true);
user_pref("extensions.agentSpoof.limitTab", false);
user_pref("extensions.agentSpoof.screenSize", "1366x768");
user_pref("extensions.agentSpoof.scriptInjection", true);
user_pref("extensions.agentSpoof.timeInterval", "none");
user_pref("extensions.agentSpoof.tzOffset", "0");
user_pref("extensions.agentSpoof.uaChosen", "default");
user_pref("extensions.agentSpoof.via", false);
user_pref("extensions.agentSpoof.windowName", true);
user_pref("extensions.agentSpoof.xff", false);


/****** Start Up ******/

// disable first start / update notifications
user_pref("browser.slowStartup.notificationDisabled", true);
user_pref("browser.slowStartup.maxSamples", 0);
user_pref("browser.slowStartup.samples", 0);
user_pref("browser.rights.3.shown", true);
user_pref("browser.startup.homepage_override.mstone", "ignore");
user_pref("startup.homepage_welcome_url", "");
user_pref("startup.homepage_override_url", "");
user_pref("browser.feeds.showFirstRunUI", false);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.usedOnWindows10.introURL", "");

// user_pref("startup.homepage welcome url", "about:newtab");

/****** Warnings / Notifications ******/

// disable warning on multiple tabs close
user_pref("browser.tabs.warnOnClose", false);

// disable miscellaneous tips / notifications
user_pref("browser.newtabpage.introShown", true);
user_pref("browser.rights.3.shown", true);
user_pref("browser.reader.detectedFirstArticle", true);
user_pref("browser.customizemode.tip0.shown", true);

/****** Plugins ******/

// 0 means it is disabled.
// 1 means click to play is active
// 2 means it is enabled
user_pref("plugin.default.state", 0);
user_pref("plugin.defaultXpi.state", 0);
user_pref("plugins.click_to_play", true);

// Java plugin state - never activate
user_pref("plugin.state.java", 0);
user_pref("plugin.state.npdeployjava1", 0);

// disable sending installed plug-ins/extensions
// test with https://panopticlick.eff.org or https://amiunique.org/fp or http://www.browserleaks.com/
user_pref("security.xpconnect.plugin.unrestricted", false);

/****** Customisation ******/

// set home page
user_pref("browser.startup.homepage", "about:newtab");

// pinned newtab page thumbnails
user_pref("browser.newtabpage.pinned", "[{\"url\":\"https://github.com/\",\"title\":\"GitHub · Build software better, together.\"},{\"url\":\"http://www.macrumors.com/\",\"title\":\"Mac Rumors: Apple Mac iOS Rumors and News You Care About\"},{\"url\":\"https://www.facebook.com/\",\"title\":\"Facebook\"},{\"url\":\"https://www.privacytools.io/\",\"title\":\"privacy tools - encryption against global mass surveillance 🔒\"}]");

// Start with 0 = blank page, 1 = home page, 3 = last session
// http://kb.mozillazine.org/Browser.startup.page
user_pref("browser.startup.page", 3);

// use global zoom
user_pref("browser.zoom.siteSpecific", false);

// Downloading to Downloads folder
// 0 = desktop, 1 = Downloads folder, 2 = most recently used location
user_pref("browser.download.folderList",        1);

// use download folder above (true) or ask where to save the file (false)
// https://developer.mozilla.org/en/Download_Manager_preferences
user_pref("browser.download.useDownloadDir",        true);

// tab specific max number of pages that can be traversed when moving forward/backward in history - affects total memory consumption
user_pref("browser.sessionhistory.max_entries", 5);

// keyboard backspace key action: 0=go back, 1=page up, 2=disable
user_pref("browser.backspace_action", 2);

// Devtools theme
user_pref("devtools.theme", "dark");

// default search engine
// user_pref("browser.search.defaultenginename",         "DuckDuckGo");

/****** Security / Fingerprinting ******/

// Web GL
// user_pref("pdfjs.enableWebGL", false);
// user_pref("webgl.min_capability_mode", true);
// user_pref("webgl.disable-extensions", true);

// prevent scripts from modifying the window
user_pref("dom.disable_window_flip", true);                                 // [boolean] whether to disable JS ability to change window z-order
user_pref("dom.disable_window_move_resize", true);                          // [boolean] whether to disable JS ability to move/resize windows
user_pref("dom.disable_window_open_feature.close", true);
user_pref("dom.disable_window_open_feature.directories", true);             // [boolean] whether to disable JS ability to hide bookmarks toolbar
user_pref("dom.disable_window_open_feature.location", true);
user_pref("dom.disable_window_open_feature.menubar", true);                 // [boolean] whether to disable JS ability to hide the menu bar
user_pref("dom.disable_window_open_feature.minimizable", true);             // [boolean] whether to disable JS ability to disable window minimizing
user_pref("dom.disable_window_open_feature.personalbar", true);             // [boolean] whether to disable JS ability to hide the personal tool bar
user_pref("dom.disable_window_open_feature.resizable", true);
user_pref("dom.disable_window_open_feature.scrollbars", true);              // [boolean] whether to disable JS ability to hide scroll bars
user_pref("dom.disable_window_open_feature.status", true);                  // [boolean] whether to disable JS ability to hide the status bar
user_pref("dom.disable_window_open_feature.titlebar", false);               // [boolean] whether to disable JS ability to hide the title bar
user_pref("dom.disable_window_open_feature.toolbar", true);                 // [boolean] whether to disable JS ability to hide the tool bar
user_pref("dom.event.contextmenu.enabled", false);                          // [boolean] whether JS can alter/hide context menu


// disables image manipulation by scripts
user_pref("dom.disable_image_src_set", false);

// disable front fingerprinting
// test with http://www.browserleaks.com/fonts
user_pref("browser.display.use_document_fonts", 0);

/******************************************************************************
 * user.js - Overwrites                                                       *
 * https://github.com/pyllyukko/user.js                                       *
 ******************************************************************************/

// New Tab Page
user_pref("browser.newtabpage.enabled",     true); // top sites
user_pref("browser.newtab.preload",     true);

// enable Location-Aware Browsing
// http://www.mozilla.org/en-US/firefox/geolocation/
user_pref("geo.enabled",        true);

// enable webGL
// http://www.contextis.com/resources/blog/webgl-new-dimension-browser-exploitation/
user_pref("webgl.disabled",     false);

// enable the built-in PDF viewer (CVE-2015-2743)
// https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-2743
user_pref("pdfjs.disabled",     false);

// DNT HTTP header
// http://dnt.mozilla.org/
// https://en.wikipedia.org/wiki/Do_not_track_header
// https://dnt-dashboard.mozilla.org
// https://github.com/pyllyukko/user.js/issues/11
user_pref("privacy.donottrackheader.enabled",         true);

// http://kb.mozillazine.org/Network.http.sendRefererHeader#0
// https://bugzilla.mozilla.org/show_bug.cgi?id=822869
// Send a referer header with the target URI as the source
// You should use a Extension to do this: https://addons.mozilla.org/en-US/firefox/addon/refcontrol/
// user_pref("network.http.sendRefererHeader",         1); // send only when links are clicked
// user_pref("network.http.referer.spoofSource",           false); // spoof the referer and use the target URI instead
user_pref("network.http.referer.XOriginPolicy",         1); // only send if base domains match

// CIS Version 1.2.0 October 21st, 2011 2.1.2 Auto Notification of Outdated Plugins
// https://wiki.mozilla.org/Firefox3.6/Plugin_Update_Awareness_Security_Review
user_pref("plugins.update.notifyUser",          false); // if true opens on every launch

// enable pocket
// user_pref("browser.pocket.enabled",           true);

// Disable firefox hello
// https://wiki.mozilla.org/Loop
user_pref("loop.enabled",     false);

// https://wiki.mozilla.org/Platform/Features/Telemetry
// https://www.mozilla.org/en-US/legal/privacy/firefox.html#telemetry
// https://wiki.mozilla.org/Security/Reviews/Firefox6/ReviewNotes/telemetry
// user_pref("toolkit.telemetry.enabled",      true);
// https://gecko.readthedocs.org/en/latest/toolkit/components/telemetry/telemetry/preferences.html
// user_pref("toolkit.telemetry.unified",      true);
// https://wiki.mozilla.org/Telemetry/Experiments
// user_pref("experiments.supported",      true);
// user_pref("experiments.enabled",        true);

// Enable sending of the health report
// https://support.mozilla.org/en-US/kb/firefox-health-report-understand-your-browser-perf
// user_pref("datareporting.healthreport.uploadEnabled",       true);
// enable collection of the data (the healthreport.sqlite* files)
// user_pref("datareporting.healthreport.service.enabled",     true);
// https://gecko.readthedocs.org/en/latest/toolkit/components/telemetry/telemetry/preferences.html
// user_pref("datareporting.policy.dataSubmissionEnabled",     true);

/******************************************************************************
 * History / Private browsing                                                 *
 *                                                                            *
 ******************************************************************************/

// Remember Sessions
// http://kb.mozillazine.org/Browser.sessionstore.enabled
user_pref("browser.sessionstore.enabled",       true);

// Private browsing
// https://support.mozilla.org/en-US/kb/Private-Browsing
// https://wiki.mozilla.org/PrivateBrowsing
user_pref("browser.privatebrowsing.autostart",      false);

// clear specific history data when firefox closes
// https://support.mozilla.org/en-US/kb/Clear%20Recent%20History#w_how-do-i-make-firefox-clear-my-history-automatically
user_pref("privacy.sanitize.sanitizeOnShutdown",    false);
user_pref("privacy.clearOnShutdown.cache",          false);
user_pref("privacy.clearOnShutdown.cookies",        false);
user_pref("privacy.clearOnShutdown.downloads",      true);
user_pref("privacy.clearOnShutdown.formdata",       true);
user_pref("privacy.clearOnShutdown.history",        false);
user_pref("privacy.clearOnShutdown.offlineApps",    true);
user_pref("privacy.clearOnShutdown.passwords",      true);
user_pref("privacy.clearOnShutdown.sessions",       false);
user_pref("privacy.clearOnShutdown.siteSettings",   false);

// remember and show browsing history
user_pref("places.history.enabled",                 true);
user_pref("browser.urlbar.suggest.history",         true);
user_pref("browser.urlbar.autocomplete.enabled",    true);

// http://kb.mozillazine.org/About:config_entries#Browser
// http://kb.mozillazine.org/Inline_autocomplete
// user_pref("browser.urlbar.autoFill",        false);
// user_pref("browser.urlbar.autoFill.typed",      false);

// http://www.labnol.org/software/browsers/prevent-firefox-showing-bookmarks-address-location-bar/3636/
// http://kb.mozillazine.org/Browser.urlbar.maxRichResults
// "Setting the preference to 0 effectively disables the Location Bar dropdown entirely."
// user_pref("browser.urlbar.maxRichResults",      0);

// Display an error message indicating the entered information is not a valid
// URL instead of asking from google.
// http://kb.mozillazine.org/Keyword.enabled#Caveats
user_pref("keyword.enabled",        true); // enable search in URLbar

// CIS 2.5.1 Accept Only 1st Party Cookies
// http://kb.mozillazine.org/Network.cookie.cookieBehavior#1
user_pref("network.cookie.cookieBehavior",      1);

// Cookie expire time
// 0 - from server, 1 prompt, 2 end of session (browser closes), 3 num of days (see network.cookie.lifetime.days)
// http://kb.mozillazine.org/Network.cookie.lifetimePolicy#0
user_pref("network.cookie.lifetimePolicy",      0);
// user_pref("network.cookie.lifetime.days",       7);
