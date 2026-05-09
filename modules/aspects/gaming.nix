{
  my.gaming.nixos = {pkgs, ...}: {
    programs = {
      corectrl.enable = true;

      gamemode = {
        enable = true;
        settings = {
          general = {
            renice = 10;
            ioprio = 0;
          };

          custom = {
            start = "${pkgs.systemd}/bin/systemctl stop keyd";
            end = "${pkgs.systemd}/bin/systemctl start keyd";
          };

          gpu = {
            amd_performance_level = "high";
            apply_gpu_optimisations = "accept-responsibility";
            gpu_device = 1;
          };
        };
      };

      gamescope.enable = true;

      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = false;
        gamescopeSession.enable = true;
      };
    };
  };

  my.gaming.homeManager = {pkgs, ...}: {
    home.packages = [pkgs.protonup-qt];

    programs.mangohud.enable = true;
  };
}
