{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      font-awesome
      maple-mono-NF
      material-icons
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Sans" "Noto Serif Thai"];
        sansSerif = ["Noto Sans Serif" "Noto Sans Thai"];
        monospace = ["Maple Mono NF"];
      };
    };
  };
}
