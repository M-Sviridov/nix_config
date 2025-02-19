{
  pkgs,
  inputs,
  username,
  host,
  profile,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.catppuccin.nixosModules.catppuccin
  ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs username host profile;};
    users.${username} = {
      imports = [
        ./../home
        inputs.catppuccin.homeManagerModules.catppuccin
      ];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.11";
      };
      programs = {
        btop.enable = true;
        home-manager.enable = true;
        neovim.enable = true;
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

