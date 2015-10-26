/******************************************************************************
 * Publicarray's Custom Settings - add the contents of this file              *
 *                                 to the bottom of the user.js               *
 *                                                                            *
 ******************************************************************************/

// http://www.ghacks.net/2015/08/18/a-comprehensive-list-of-firefox-privacy-and-security-settings/

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

user_pref("plugin.default.state", 0);
user_pref("plugin.defaultXpi.state", 0);
user_pref("plugins.click_to_play", true);

// disable sending installed plug-ins/extensions
// test with https://panopticlick.eff.org or https://amiunique.org/fp or http://www.browserleaks.com/
user_pref("plugins.enumerable_names", ""); // deprecated: https://bugzilla.mozilla.org/show_bug.cgi?id=1169945
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

// default search engine
// user_pref("browser.search.defaultenginename",         "DuckDcukGo");

/****** Security / Fingerprinting ******/

// stop scripts from closing windows
user_pref("dom.allow_scripts_to_close_windows", false);

// disables image manipulation by scripts
user_pref("dom.disable_image_src_set", false);

// disable front fingerprinting
// test with http://www.browserleaks.com/fonts
user_pref("browser.display.use_document_fonts", 0);


/****** Performance ******/

// pipelining
// http://www.techfragments.com/481/the-12-best-firefox-aboutconfig-performance-tweaks/
// user_pref("network.http.pipelining", true);
// user_pref("network.http.pipelining.ssl", true);
// user_pref("network.http.proxy.pipelining", true);

/******************************************************************************
 * user.js - Overwrites                                                       *
 * https://github.com/pyllyukko/user.js                                       *
 ******************************************************************************/

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
user_pref("network.http.sendRefererHeader",         1); // send only when links are clicked
user_pref("network.http.referer.spoofSource",           true); // spoof the referer and use the target URI instead
user_pref("network.http.referer.XOriginPolicy",         1); // only send if base domains match
// CIS Version 1.2.0 October 21st, 2011 2.4.3 Disable Referer from an SSL Website
user_pref("network.http.sendSecureXSiteReferrer",       false);

// CIS Version 1.2.0 October 21st, 2011 2.1.2 Auto Notification of Outdated Plugins
// https://wiki.mozilla.org/Firefox3.6/Plugin_Update_Awareness_Security_Review
user_pref("plugins.update.notifyUser",          false); // if true opens on every launch

// enable pocket
// user_pref("browser.pocket.enabled",           true);


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

// remember browsing history
user_pref("places.history.enabled",         true);

// CIS 2.5.1 Accept Only 1st Party Cookies
// http://kb.mozillazine.org/Network.cookie.cookieBehavior#1
user_pref("network.cookie.cookieBehavior",      1);

// Cookie expire time
// 0 - from server, 1 prompt, 2 end of session (browser closes), 3 num of days (see network.cookie.lifetime.days)
// http://kb.mozillazine.org/Network.cookie.lifetimePolicy#0
user_pref("network.cookie.lifetimePolicy",      0);
// user_pref("network.cookie.lifetime.days",       7);
