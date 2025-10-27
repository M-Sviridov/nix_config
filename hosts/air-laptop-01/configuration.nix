{
  inputs,
  outputs,
  timeZone,
  ...
}: {
  imports = [
    outputs.darwinModules.fonts
    outputs.darwinModules.homebrew
    outputs.darwinModules.networking
    outputs.darwinModules.nix
    outputs.darwinModules.packages
    outputs.darwinModules.system

    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = timeZone;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.stateVersion = 6;
}
