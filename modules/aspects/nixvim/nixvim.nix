{inputs, ...}: {
  flake-file.inputs = {
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  my.nixvim.homeManager = {
    imports = [inputs.nixvim.homeModules.nixvim];
    programs.nixvim.enable = true;
  };
}
