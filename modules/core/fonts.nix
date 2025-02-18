{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      font-awesome
      maple-mono-NF
      material-icons
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };
}

