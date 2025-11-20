{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.packages.common;
in {
  options.packages.common.enable = mkEnableOption "common packages";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ansible
      awscli
      bootdev-cli
      goose
      hunspell
      hunspellDicts.en_AU-large
      hunspellDicts.fr-any
      hunspellDicts.th_TH
      imagemagick
      jq
      opentofu
      sqlc
      sqlite
      terraform
      wget
    ];
  };
}
