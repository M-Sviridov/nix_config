{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.my.programs.aerospace;
in {
  options.my.programs.aerospace = {
    enable = mkEnableOption "AeroSpace tiling window manager for macOS";
  };

  config = mkIf cfg.enable {
    xdg.configFile."aerospace/aerospace.toml".source = ./aerospace.toml;
  };
}
