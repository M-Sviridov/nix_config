{
  description = "NixOS & Nix-Darwin Config";

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
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
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
    nix-darwin,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;

    machines = {
      air-laptop-01 = {
        system = "aarch64-darwin";
        user = "msviridov";
        type = "darwin";
      };

      loki = {
        system = "x86_64-linux";
        user = "msviridov";
        type = "nixos";
      };
    };

    mkDarwin = hostname: config:
      nix-darwin.lib.darwinSystem {
        system = config.system;
        specialArgs = {inherit inputs outputs hostname;};
        modules = [./hosts/${hostname}/configuration.nix];
      };

    mkHome = hostname: config:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${config.system};
        extraSpecialArgs = {
          inherit inputs outputs hostname;
          user = config.user;
        };
        modules = [./hosts/${hostname}/home.nix];
      };

    mkNixos = hostname: config:
      nixpkgs.lib.nixosSystem {
        system = config.system;
        specialArgs = {
          inherit inputs outputs hostname;
          user = config.user;
        };
        modules = [./hosts/${hostname}/configuration.nix];
      };
  in {
    darwinModules = import ./modules/darwin;
    homeManagerModules = import ./modules/home-manager;
    nixosModules = import ./modules/nixos;

    darwinConfigurations =
      nixpkgs.lib.mapAttrs mkDarwin
      (nixpkgs.lib.filterAttrs (n: v: v.type == "darwin") machines);

    homeConfigurations =
      nixpkgs.lib.mapAttrs' (
        hostname: config:
          nixpkgs.lib.nameValuePair "${config.user}@${hostname}" (mkHome hostname config)
      )
      machines;

    nixosConfigurations =
      nixpkgs.lib.mapAttrs mkNixos
      (nixpkgs.lib.filterAttrs (n: v: v.type == "nixos") machines);

    formatter =
      nixpkgs.lib.genAttrs
      (nixpkgs.lib.unique (nixpkgs.lib.mapAttrsToList (n: v: v.system) machines))
      (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
