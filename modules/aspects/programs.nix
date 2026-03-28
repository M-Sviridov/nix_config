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

      eza = {
        enable = true;
        enableZshIntegration = true;
        colors = "always";
      };

      fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = [
          "--cmd cd"
        ];
      };
    };
  };
}
