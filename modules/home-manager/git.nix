{...}: {
  programs.git = {
    enable = true;

    extraConfig = {
      branch.sort = "-committerdate";
      color.ui = "auto";
      column.ui = "auto";
      commit.verbose = "true";
      core.compression = 9;
      diff.algorithm = "histogram";
      maintenance.strategy = "incremental";
      merge.conflictStyle = "zdiff3";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      status.branch = true;
      tag.sort = "-version:refname";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        navigate = true;
        side-by-side = true;
      };
    };

    maintenance.enable = true;
    userEmail = "74146348+M-Sviridov@users.noreply.github.com";
    userName = "M-Sviridov";
  };
}
