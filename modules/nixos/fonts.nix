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

    packages = with pkgs; [
      corefonts
      font-awesome
      maple-mono.NF-unhinted
      material-icons
      nerd-fonts.jetbrains-mono
      nerd-fonts.noto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      overpass
      rubik
    ];
  };
}
