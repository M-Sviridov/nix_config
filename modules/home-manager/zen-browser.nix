{pkgs, ...}: {
  programs.zen-browser = {
    enable = true;

    languagePacks = [
      "en-US"
      "fr"
      "ru"
      "th"
    ];

    profiles.msviridov = {
      id = 0;

      containers = {
        "Admin" = {
          color = "red";
          icon = "fingerprint";
          id = 1;
        };

        "Personal" = {
          color = "green";
          icon = "circle";
          id = 2;
        };

        "Work" = {
          color = "blue";
          icon = "briefcase";
          id = 3;
        };
      };

      containersForce = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        catppuccin-web-file-icons
        # enhancer-for-youtube
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
        default = "ddg";
        engines = {
          "amazondotcom-us".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "google".metaData.hidden = true;
          "wikipedia".metaData.hidden = true;
        };

        force = true;
        order = ["ddg"];
        privateDefault = "ddg";
      };
    };
  };
}
