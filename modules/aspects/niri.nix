{
  flake-file.inputs.niri = {
    url = "github:sodiboo/niri-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  my.niri.nixos = {
    nix = {
      substituters = [
        "https://niri.cachix.org"
      ];
    };
  }; 

  my.niri.homeManager = {
    programs.niri.enable = false;
  };
}
