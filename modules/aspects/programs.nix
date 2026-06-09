{
  my.programs.homeManager = {pkgs, ...}: {
    programs = {
      bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [
          batman
          batpipe
          batgrep
        ];
      };

      chromium.enable = true;

      eza = {
        enable = true;
        enableZshIntegration = true;
        colors = "always";
      };

      fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      imv.enable = true;

      mpv = {
        enable = true;

        config = {
          hwdec = "auto";
          profile = "default";
          save-position-on-quit = "yes";
          sub-auto = "fuzzy";
          sub-border-size = 1;
          sub-font = "Noto Sans";
          sub-shadow = 3;
          sub-shadow-color = "#000000";
          sub-shadow-offset = 2;
        };

        scripts = with pkgs.mpvScripts; [
          mpris
        ];
      };

      onlyoffice.enable = true;

      rbw = {
        enable = true;

        settings = {
          base_url = "https://vault.msviridov.com";
          email = "perso@msviridov.com";
          pinentry = pkgs.pinentry-gnome3;
        };
      };

      ripgrep.enable = true;
      zathura.enable = true;

      zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [
          "--cmd cd"
        ];
      };
    };
  };

  my.programs.nixos = {
    programs = {
      localsend = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
