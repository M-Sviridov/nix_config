{inputs, ...}: {
  flake-file.inputs.catppuccin.url = "github:catppuccin/nix";

  my.catppuccin.nixos = {
    imports = [inputs.catppuccin.nixosModules.catppuccin];

    catppuccin = {
      autoEnable = true;
      enable = true;
    };
  };

  my.catppuccin.homeManager = {
    imports = [inputs.catppuccin.homeModules.catppuccin];

    catppuccin = {
      autoEnable = true;
      enable = true;
      mpv.enable = false;

      wezterm = {
        enable = true;
        apply = true;
      };
    };
  };
}
