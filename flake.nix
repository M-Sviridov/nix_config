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
    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    niri.url = "github:sodiboo/niri-flake";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      fw-fanctrl,
      home-manager,
      hyprland,
      hyprpanel,
      hyprsplit,
      nixos-hardware,
      nixpkgs,
      nur,
      solaar,
      zen-browser,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      host = "loki"; # change to machine hostname
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
      user = "msviridov"; # change to username
    in
    {
      homeManagerModules = import ./modules/home-manager;
      nixosModules = import ./modules/nixos;

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs outputs user; };
        modules = [ ./hosts/${host}/home.nix ];
      };

      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs outputs host; };
        modules = [ ./hosts/${host}/configuration.nix ];
      };
    };
}
