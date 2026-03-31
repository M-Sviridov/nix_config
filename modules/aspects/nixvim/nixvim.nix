{
  den,
  inputs,
  ...
}: {
  flake-file.inputs = {
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  my.nixvim.homeManager = {
    imports = [inputs.nixvim.homeModules.nixvim];
    programs.nixvim.enable = true;
  };
}
