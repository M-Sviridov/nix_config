{
  my.gaming.nixos = {
    programs = {
      corectrl.enable = true;
      gamemode.enable = true;
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
