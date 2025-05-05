{...}: {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = "auto";
      init.defaultBranch = "main";
    };
    delta.enable = true;
    userEmail = "74146348+M-Sviridov@users.noreply.github.com";
    userName = "M-Sviridov";
  };
}
