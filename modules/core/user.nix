{
  pkgs,
  inputs,
  username,
  host,
  profile,
  ...
}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.fw-fanctrl.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    inputs.nvf.nixosModules.default
  ];
  home-manager = {
    useUserPackages = true;
    # useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs username host profile;};
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
