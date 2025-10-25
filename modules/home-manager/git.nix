{config, ...}: {
  programs.git = {
    enable = true;
    maintenance.enable = true;

    settings = {
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

      user = {
        email = "74146348+M-Sviridov@users.noreply.github.com";
        name = "M-Sviridov";
      };
    };

    signing = {
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/sign_github_ed25519.pub";
      signByDefault = true;
    };
  };
}
