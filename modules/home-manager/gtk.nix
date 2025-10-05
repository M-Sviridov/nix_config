{pkgs, ...}: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 24;
    };

    font = {
      name = "Noto Sans";
      size = 12;
    };

    gtk3 = {
      bookmarks = [
        "file:///home/msviridov/documents/"
        "file:///home/msviridov/downloads/"
        "file:///home/msviridov/music/"
        "file:///home/msviridov/pictures/"
        "file:///home/msviridov/videos/"
      ];
    };

    theme = {
      name = "Catppuccin-GTK-Purple-Dark";
      package = pkgs.magnetic-catppuccin-gtk.override {
        accent = ["purple"];
        tweaks = ["macos"];
      };
    };
  };
}
