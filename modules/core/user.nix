{
  pkgs,
  pkgs-nur,
  inputs,
  username,
  host,
  profile,
  system,
  ...
}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.fw-fanctrl.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    inputs.nur.modules.nixos.default
    inputs.nvf.nixosModules.default
  ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs username host profile system pkgs-nur;};
    users.${username} = {
      imports = [
        ./../home
        inputs.catppuccin.homeManagerModules.catppuccin
        inputs.hyprpanel.homeManagerModules.hyprpanel
        inputs.nvf.homeManagerModules.default
      ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.11";
      };
      programs = {
        bat = {
          enable = true;
          extraPackages = with pkgs.bat-extras; [
            batman
            batpipe
            batgrep
          ];
        };
        btop = {
          enable = true;
          settings = {
            vim_keys = true;
          };
        };
        home-manager.enable = true;
        tofi = {
          enable = true;
          settings = {
            anchor = "top";
            ascii-input = false;
            background-color = "#1e1e2e";
            border-width = 0;
            font = "/home/${username}/.local/share/fonts/MapleMono-NF-Regular.ttf";
            font-size = 14;
            height = 40;
            hint-font = false;
            horizontal = true;
            matching-algorithm = "fuzzy";
            min-input-width = 120;
            outline-color = "#cba6f7";
            outline-width = 0;
            prompt-text = " run:  ";
            result-spacing = 15;
            margin-top = 5;
            padding-top = 0;
            padding-bottom = 0;
            padding-left = 10;
            padding-right = 0;
            width = "100%";
          };
        };
      };
      gtk = {
        enable = true;
      };
    };
  };
  users.mutableUsers = true;
  users.users.${username} = {
    extraGroups = ["networkmanager" "wheel"];
    ignoreShellProgramCheck = true;
    isNormalUser = true;
    packages = with pkgs; [nautilus];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = ["${username}"];
}
