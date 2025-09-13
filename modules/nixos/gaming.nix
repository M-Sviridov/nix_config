{pkgs, ...}: {
  programs = {
    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
          ioprio = 0;
        };

        gpu = {
          amd_performance_level = "high";
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 1;
        };
      };
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
  };

  environment.systemPackages = with pkgs; [mangohud];
}
