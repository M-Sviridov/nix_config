{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "dmz-authentik".hostname = "dmz-authentik-server";
      "dmz-caddy".hostname = "dmz-caddy-server";
      "dmz-calibre".hostname = "dmz-calibre-server";
      "dmz-freshrss".hostname = "dmz-freshrss-server";
      "dmz-immich".hostname = "dmz-immich-server";
      "dmz-vaultwarden".hostname = "dmz-vaultwarden-server";

      "docker".hostname = "docker-server";
      "fileserver".hostname = "fileserver-server";

      "github.com" = {
        identityFile = "~/.ssh/github_key";
      };

      "haos-aopo" = {
        hostname = "haos-aopo";
        user = "root";
        identityFile = "~/.ssh/haos-aopo_key";
      };

      "heimdall" = {
        hostname = "heimdall";
        user = "root";
      };

      "hetzner" = {
        hostname = "188.245.176.92";
        identityFile = "~/.ssh/hetzner_key";
      };

      "jellyfin".hostname = "jellyfin-server";

      "opnsense" = {
        hostname = "opnsense-router";
        identityFile = "~/.ssh/opnsense_key";
      };

      "pbs" = {
        hostname = "pbs-server";
        user = "root";
        identityFile = "~/.ssh/pbs-server_key";
      };

      "prod-caddy".hostname = "prod-caddy-server";
      "prod-control".hostname = "prod-control-server";
      "prod-docker".hostname = "prod-docker-server";
      "prod-frigate".hostname = "prod-frigate-server";
      "prod-grafana".hostname = "prod-grafana-server";
      "prod-influxdb".hostname = "prod-influxdb-server";
      "prod-openwebui".hostname = "prod-openwebui-server";
      "prod-pms".hostname = "prod-pms-server";

      "pve-club" = {
        hostname = "pve-club";
        user = "root";
        identityFile = "~/.ssh/pve-club_key";
      };

      "raspi".hostname = "raspi";
    };
  };
}
