{inputs, ...}: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v5";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # my.niri.homeManager = {
  #   imports = [inputs.noctalia.homeModules.default];
  #
  #   programs = {
  #     niri.settings = let
  #       leaderKey = "Super";
  #     in {
  #       binds = {
  #         "${leaderKey}+n".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "panel-toggle"
  #           "notifications"
  #         ];
  #         "${leaderKey}+v".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "panel-toggle"
  #           "clipboard"
  #         ];
  #         "Ctrl+Alt+q".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "session"
  #           "lock"
  #         ];
  #         "Ctrl+Space".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "panel-toggle"
  #           "launcher"
  #         ];
  #         "XF86AudioRaiseVolume".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "volume-up"
  #         ];
  #         "XF86AudioLowerVolume".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "volume-down"
  #         ];
  #         "XF86AudioMute".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "volume-mute"
  #         ];
  #         "XF86AudioNext".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "media"
  #           "next"
  #         ];
  #         "XF86AudioPlay".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "media"
  #           "toggle"
  #         ];
  #         "XF86AudioPrev".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "media"
  #           "previous"
  #         ];
  #         "XF86MonBrightnessDown".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "brightness-down"
  #         ];
  #         "XF86MonBrightnessUp".action.spawn = [
  #           "noctalia"
  #           "msg"
  #           "brightness-up"
  #         ];
  #       };
  #
  #       layer-rules = [
  #         {
  #           matches = [{namespace = "^noctalia-backdrop";}];
  #           place-within-backdrop = true;
  #         }
  #       ];
  #
  #       spawn-at-startup = [{argv = ["noctalia"];}];
  #     };
  #     noctalia = {
  #       enable = false;
  #
  #       settings = {
  #         theme = {
  #           mode = "dark";
  #           source = "builtin";
  #           builtin = "Catppuccin";
  #         };
  #       };
  #     };
  #   };
  # };
}
