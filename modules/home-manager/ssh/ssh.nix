{config, ...}: let
  sshDir = "${config.home.homeDirectory}/.ssh";
in {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        user = "msviridov";
        identitiesOnly = true;
      };

      "*aopo*" = {
        user = "tsst";
        identitiesOnly = true;
      };

      # Ao Po PROD
      "prod-aopo*".identityFile = "${sshDir}/id_aopo_prod_ed25519.pub";

      # Club PROXMOX
      "pve-club" = {
        user = "root";
        identityFile = "${sshDir}/pve-club_key";
      };

      # Github
      "github.com".identityFile = "${sshDir}/id_github_ed25519.pub";

      # Homelab DMZ
      "dmz*".identityFile = "${sshDir}/id_home_dmz_ed25519.pub";

      # Homelab MGMT
      "heimdall pbs-server" = {
        user = "root";
        identityFile = "${sshDir}/id_home_mgmt_ed25519.pub";
      };

      # Homelab OPNSENSE
      "opnsense-router".identityFile = "${sshDir}/id_home_opnsense_ed25519.pub";

      # Homelab PROD
      "docker-server".identityFile = "${sshDir}/id_home_prod_ed25519.pub";
      "file-server".identityFile = "${sshDir}/id_home_prod_ed25519.pub";
      "jellyfin-server".identityFile = "${sshDir}/id_home_prod_ed25519.pub";
      "prod*".identityFile = "${sshDir}/id_home_prod_ed25519.pub";
    };
  };
}
