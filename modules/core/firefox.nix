{...}: {
  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxAccounts = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DNSOverHTTPS = {
        Fallback = false;
      };
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "FirefoxColor@mozilla.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
          installation_mode = "force_installed";
        };
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/stylus/latest.xpi";
          installation_mode = "force_installed";
        };
	"{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
	  install_urg = "https://addons.mozilla.org/firefox/downloads/latest/vimium/latest.xpi";
	  installation_mode = "force_installed";
	};
	"firefox@tampermonkey.net" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
	  installation_mode = "force_installed";
        };
      };
      Homepage = {
        URL = "https://todo.lan.msviridov.com";
        StartPage = "homepage";
      };
      HttpsOnlyMode = "enabled";
      OfferToSaveLogins = false;

      PasswordManagerEnabled = false;
      PictureInPicture = false;
    };
  };
}
