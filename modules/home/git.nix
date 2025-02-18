{...}: {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = "auto";
      init.defaultBranch = "main";
    };
    userEmail = "74146348+M-Sviridov@users.noreply.github.com";
    userName = "M-Sviridov";
  };
}

