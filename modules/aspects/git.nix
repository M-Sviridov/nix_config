{
  my.git.homeManager = {
    config,
    lib,
    ...
  }: {
    programs.git = {
      enable = true;
      maintenance.enable = true;
      ignores = [".DS_Store" ".direnv" "result"];

      signing = {
        format = "ssh";
        key = "${config.home.homeDirectory}/.ssh/sign_github_ed25519.pub";
        signByDefault = true;
      };

      settings = {
        user = {
          name = "M-Sviridov";
          email = "74146348+M-Sviridov@users.noreply.github.com";
        };
        branch.sort = "-committerdate";
        column.ui = "auto";
        commit.verbose = true;
        core.compression = 9;
        diff.algorithm = "histogram";
        init.defaultBranch = "main";
        maintenance.strategy = "incremental";
        merge.conflictStyle = "zdiff3";
        push.autoSetupRemote = true;
        tag.sort = "-version:refname";
      };
      extraSettings = {
        pull.rebase = true;
        rerere.enabled = true;
      };
    };
  };
}
