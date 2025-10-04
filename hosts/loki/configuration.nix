# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  inputs,
  lib,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    outputs.nixosModules.amd-graphics
    outputs.nixosModules.bluetooth
    outputs.nixosModules.boot
    outputs.nixosModules.catppuccin
    outputs.nixosModules.fingerprint
    outputs.nixosModules.fonts
    outputs.nixosModules.framework-13-7040-amd
    # outputs.nixosModules.fw-fanctrl
    outputs.nixosModules.gaming
    outputs.nixosModules.hyprland
    outputs.nixosModules.keyd-remapper
    outputs.nixosModules.logitech
    outputs.nixosModules.networking
    outputs.nixosModules.nix
    outputs.nixosModules.packages
    outputs.nixosModules.programs
    outputs.nixosModules.services
    outputs.nixosModules.shares
    outputs.nixosModules.sound
    outputs.nixosModules.tailscale

    inputs.catppuccin.nixosModules.catppuccin
    # inputs.fw-fanctrl.nixosModules.default
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    inputs.solaar.nixosModules.default

    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.pathsToLink = ["/share/zsh"];

  time.timeZone = "Asia/Bangkok";

  i18n.defaultLocale = "en_DK.UTF-8";

  users.users.msviridov = {
    isNormalUser = true;
    extraGroups = [
      "dialout"
      "gamemode"
      "input"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  security.pam.services.login.enableGnomeKeyring = true;

  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = ["msviridov"];
        commands = [
          {
            command = "/run/current-system/sw/bin/systemctl stop keyd";
            options = ["NOPASSWD"];
          }
          {
            command = "/run/current-system/sw/bin/systemctl start keyd";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };

  system.stateVersion = "24.11";
}
