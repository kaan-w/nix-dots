{
  # Don't check default browser
  "browser.shell.checkDefaultBrowser" = false;

  # Don't warn before quitting
  "browser.warnOnQuit" = false;

  # Prefer DNS-over-HTTPS, fallback to system DNS if needed
  "network.trr.mode" = 2;

  # Enable WebRender
  "gfx.webrender.all" = true;

  # Remove the picture-in-picture toggle
  "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;

  # Show the bookmarks toolbar
  "browser.toolbars.bookmarks.visibility" = "always";

  # Don't show warning on "about:config" page
  "browser.aboutConfig.showWarning" = false;

  # Do not auto-disable externally installed extensions
  "extensions.autoDisableScopes" = 0;

  # Don't use the built-in password manager
  "signon.rememberSignons" = false;
  "signon.autofillForms" = false;

  # Don't show the Zen welcome screen
  "zen.welcome-screen.seen" = true;

  # Open bookmarks in a new tab
  "browser.tabs.loadBookmarksInTabs" = true;

  # Disable browser geolocation APIs
  "geo.enabled" = false;

  # Disable Firefox telemetry
  "toolkit.telemetry.unified" = false;
  "toolkit.telemetry.enabled" = false;
  "toolkit.telemetry.server" = "data:,";
  "toolkit.telemetry.archive.enabled" = false;

  # Disable telemetry coverage and opt-out studies
  "toolkit.telemetry.coverage.opt-out" = true;
  "toolkit.coverage.opt-out" = true;
  "toolkit.coverage.endpoint.base" = "";

  # Disable URL bar telemetry
  "browser.urlbar.eventTelemetry.enabled" = false;

  # Disable Developer Tools telemetry
  "devtools.onboarding.telemetry.logged" = false;

  # Disable telemetry pings
  "toolkit.telemetry.newProfilePing.enabled" = false;
  "toolkit.telemetry.shutdownPingSender.enabled" = false;
  "toolkit.telemetry.updatePing.enabled" = false;
  "toolkit.telemetry.bhrPing.enabled" = false;
  "toolkit.telemetry.firstShutdownPing.enabled" = false;

  # Disable health reports
  "datareporting.healthreport.uploadEnabled" = false;
  "datareporting.healthreport.service.enabled" = false;
  "datareporting.policy.dataSubmissionEnabled" = false;
  "datareporting.usage.uploadEnabled" = false;

  # Disable crash reports
  "breakpad.reportURL" = "";
  "browser.tabs.crashReporting.sendReport" = false;
  "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

  # Disable form autofill
  "browser.formfill.enable" = false;
  "extensions.formautofill.addresses.enabled" = false;
  "extensions.formautofill.available" = "off";
  "extensions.formautofill.creditCards.available" = false;
  "extensions.formautofill.creditCards.enabled" = false;
  "extensions.formautofill.heuristics.enabled" = false;

  # Disable Firefox Pocket integration
  "extensions.pocket.enabled" = false;
  "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;

  # Disable sponsored content on the New Tab page
  "browser.newtabpage.activity-stream.showSponsored" = false;
  "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

  # Disable Firefox Home / Activity Stream feeds
  "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  "browser.newtabpage.activity-stream.feeds.snippets" = false;
  "browser.newtabpage.activity-stream.feeds.telemetry" = false;
  "browser.ping-centre.telemetry" = false;

  # Disable Top Sites section
  "browser.newtabpage.activity-stream.feeds.topsites" = false;

  # Disable Firefox search shortcut suggestions
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";

  # Disable engine suggestions
  "browser.urlbar.suggest.engines" = false;

  # Disable Firefox Accounts
  "identity.fxaccounts.enabled" = false;
  "identity.fxaccounts.toolbar.enabled" = false;
  "identity.fxaccounts.pairing.enabled" = false;
  "identity.fxaccounts.commands.enabled" = false;

  # Disable Firefox feature recommendations
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;

  # Disable extension recommendations
  "extensions.htmlaboutaddons.recommendations.enabled" = false;
  "extensions.htmlaboutaddons.discover.enabled" = false;

  # Disable Firefox discovery services
  "extensions.getAddons.showPane" = false;
  "browser.discovery.enabled" = false;

  # Don't report compatibility problems
  "extensions.webcompat-reporter.enabled" = false;

  # Disable Mozilla experiments
  "experiments.supported" = false;
  "experiments.enabled" = false;
  "experiments.manifest.uri" = "";

  # Disable Firefox Normandy
  "app.normandy.enabled" = false;
  "app.normandy.api_url" = "";

  # Disable Firefox Shield Studies
  "app.shield.optoutstudies.enabled" = false;

  # Strict tracking protection
  "browser.contentblocking.category" = "strict";

  # Enable query stripping
  "privacy.query_stripping.enabled" = true;
  "privacy.query_stripping.enabled.pbmode" = true;

  # Bounce tracking protection
  "privacy.bounceTrackingProtection.mode" = 1;

  # Enable Global Privacy Control
  "privacy.globalprivacycontrol.enabled" = true;

  # Reduce language-based fingerprinting
  "privacy.spoof_english" = 1;

  # Disable captive portal and connectivity checks
  "network.captive-portal-service.enabled" = false;
  "network.connectivity-service.enabled" = false;

  # Reduce URL bar suggestions
  "browser.urlbar.suggest.searches" = false;
  "browser.urlbar.suggest.quickactions" = false;
  "browser.urlbar.shortcuts.actions" = false;

  # Disable Firefox AI features
  "browser.ml.enable" = false;
  "browser.ml.chat.enabled" = false;
  "browser.ml.chat.page" = false;
  "browser.ml.linkPreview.enabled" = false;
  "extensions.ml.enabled" = false;
  "browser.ai.control.default" = "blocked";
  "browser.ai.control.linkPreviewKeyPoints" = "blocked";
  "browser.ai.control.pdfjsAltText" = "blocked";
  "browser.ai.control.sidebarChatbot" = "blocked";
  "browser.ai.control.smartTabGroups" = "blocked";
  "browser.ai.control.translations" = "blocked";
  "browser.tabs.groups.smart.enabled" = false;
  "browser.tabs.groups.smart.userEnabled" = false;
}
