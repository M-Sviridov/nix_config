{
  my.gtk.homeManager = {
    config,
    pkgs,
    ...
  }: {
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

      # gtk3 = {
      #   bookmarks = [
      #     "file://${config.xdg.userDirs.documents}"
      #     "file://${config.xdg.userDirs.download}"
      #     "file://${config.xdg.userDirs.music}"
      #     "file://${config.xdg.userDirs.pictures}"
      #     "file://${config.xdg.userDirs.videos}"
      #   ];
      # };

      theme = {
        name = "Catppuccin-GTK-Mauve-Dark";
        package = pkgs.magnetic-catppuccin-gtk.override {
          accent = ["mauve"];
          tweaks = ["macos" "float"];
        };
      };
    };
  };
}
