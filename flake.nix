{

  description = "NixOS Loki Config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    host = "loki";
    profile = "framework-13-amd-7040";
    username = "msviridov";
  in {
    nixosConfigurations = {
      loki = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/framework-13-amd-7040];
      };
    };
  };
}
