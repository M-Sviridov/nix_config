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
        "file:///home/msviridov/Documents/"
        "file:///home/msviridov/Downloads/"
        "file:///home/msviridov/Music/"
        "file:///home/msviridov/Pictures/"
        "file:///home/msviridov/Videos/"
      ];
    };
  };
}
