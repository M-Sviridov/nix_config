{inputs, ...}: {
  flake-file.inputs.catppuccin.url = "github:catppuccin/nix";

  my.catppuccin.nixos = {
    imports = [inputs.catppuccin.nixosModules.catppuccin];

    catppuccin.enable = true;
  };

  my.catppuccin.homeManager = {
    imports = [inputs.catppuccin.homeModules.catppuccin];

    catppuccin.enable = true;
    catppuccin.mpv.enable = false;
    catppuccin.wezterm.enable = true;
    catppuccin.wezterm.apply = true;
  };
}
