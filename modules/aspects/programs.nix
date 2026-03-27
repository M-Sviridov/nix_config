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
    # colors = {
    #   "bg+" = "#313244";
    #   "bg" = "#1e1e2e";
    #   "spinner" = "#f5e0dc";
    #   "hl" = "#f38ba8";
    #   "fg" = "#cdd6f4";
    #   "header" = "#f38ba8";
    #   "info" = "#cba6f7";
    #   "pointer" = "#f5e0dc";
    #   "marker" = "#b4befe";
    #   "fg+" = "#cdd6f4";
    #   "prompt" = "#cba6f7";
    #   "hl+" = "#f38ba8";
    #   "selected-bg" = "#45475a";
    #   "border" = "#313244";
    #   "label" = "#cdd6f4";
    # };
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
