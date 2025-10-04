{
  description = "NixOS Config";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";
    fw-fanctrl = {
      url = "github:TamtamHero/fw-fanctrl/packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:Svenum/Solaar-Flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae.url = "github:vicinaehq/vicinae";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    host = "loki"; # change to machine hostname
    pkgs = nixpkgs.legacyPackages.${system};
    system = "x86_64-linux"; # or aarch64-darwin
    user = "msviridov"; # change to username
  in {
    homeManagerModules = import ./modules/home-manager;
    nixosModules = import ./modules/nixos;

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs outputs user;};
      modules = [./hosts/${host}/home.nix];
    };

    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs outputs host;};
      modules = [./hosts/${host}/configuration.nix];
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
