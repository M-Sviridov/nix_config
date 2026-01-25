{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["Maple Mono NF"];
        sansSerif = [
          "Noto Sans"
          "Noto Sans Thai"
        ];
        serif = [
          "Noto Serif"
          "Noto Serif Thai"
        ];
      };

      hinting.enable = false;
    };

    fontDir.enable = true;

    packages = import ../shared/fonts.nix {inherit pkgs;};
  };
}
