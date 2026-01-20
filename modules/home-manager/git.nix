{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.my.programs.git;
in {
  options.my.programs.git = {
    enable = mkEnableOption "Git version control with opinionated defaults";

    userName = mkOption {
      type = types.str;
      description = "Git user name for commits";
    };

    userEmail = mkOption {
      type = types.str;
      description = "Git user email for commits";
    };

    signing = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to enable SSH commit signing";
      };

      key = mkOption {
        type = types.str;
        description = "Path to SSH public key for signing";
      };
    };

    ignores = mkOption {
      type = types.listOf types.str;
      default = [".DS_Store" ".direnv" "result"];
      description = "Global gitignore patterns";
    };

    extraSettings = mkOption {
      type = types.attrsOf types.anything;
      default = {};
      description = "Additional git settings merged with defaults";
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      maintenance.enable = true;
      ignores = cfg.ignores;

      signing = mkIf cfg.signing.enable {
        format = "ssh";
        key = cfg.signing.key;
        signByDefault = true;
      };

      settings =
        {
          user = {
            name = cfg.userName;
            email = cfg.userEmail;
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
        }
        // cfg.extraSettings;
    };
  };
}
