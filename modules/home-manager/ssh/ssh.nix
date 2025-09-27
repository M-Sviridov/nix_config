{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        user = "msviridov";
        identitiesOnly = true;
      };

      "dmz*".identityFile = "/home/msviridov/.ssh/id_home_dmz_ed25519.pub";

      "github.com".identityFile = "~/.ssh/id_github_ed25519.pub";

      "opnsense-router".identityFile = "~/.ssh/id_home_opnsense_ed25519.pub";

      "prod*".identityFile = "/home/msviridov/.ssh/id_home_prod_ed25519.pub";
      "jellyfin-server".identityFile = "/home/msviridov/.ssh/id_home_prod_ed25519.pub";
      "docker-server".identityFile = "/home/msviridov/.ssh/id_home_prod_ed25519.pub";
      "file-server".identityFile = "/home/msviridov/.ssh/id_home_prod_ed25519.pub";

      "heimdall" = {
        user = "root";
        identityFile = "/home/msviridov/.ssh/id_home_mgmt_ed25519.pub";
      };

      "pbs-server" = {
        user = "root";
        identityFile = "/home/msviridov/.ssh/id_home_mgmt_ed25519.pub";
      };

      "pve-club" = {
        user = "root";
        identityFile = "~/.ssh/pve-club_key";
      };
    };
  };
}
