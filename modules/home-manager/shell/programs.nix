{pkgs, ...}: {
  programs = {
    bat = {
      enable = true;
      # extraPackages = with pkgs.bat-extras; [
      #   batman
      #   batpipe
      #   batgrep
      # ];
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      colors = "always";
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
