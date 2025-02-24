{pkgs-nur, ...}: {
  programs.firefox = {
    enable = true;

    languagePacks = [
      "en-US"
      "fr"
      "ru"
      "th"
    ];

    policies = {
      Cookies = {
        Allow = [
          "https://youtube.com/"
        ];
        Behavior = "reject-tracker-and-partition-foreign";
      };

      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisablePocket = true;
      DisableTelemetry = true;
    };

    profiles.msviridov = {
      containers."Le Club" = {
        color = "green";
        icon = "briefcase";
        id = 0;
      };

      containersForce = true;

      extensions = with pkgs-nur.nur.repos.rycee.firefox-addons; [
        bitwarden
        catppuccin-gh-file-explorer
        enhancer-for-youtube
        firefox-color
        multi-account-containers
        proton-pass
        return-youtube-dislikes
        skip-redirect
        sponsorblock
        stylus
        tampermonkey
        ublock-origin
        vimium
      ];

      search = {
        default = "DuckDuckGo";
        force = true;
        privateDefault = "DuckDuckGo";
      };
    };
  };
}
