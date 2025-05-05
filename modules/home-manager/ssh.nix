{...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    compression = true;

    matchBlocks = {
      "adguard-01" = {
        hostname = "adguard-01.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "adguard-02" = {
        hostname = "adguard-02.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "caddy" = {
        hostname = "caddy.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "docker" = {
        hostname = "docker.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "fileserver" = {
        hostname = "fileserver.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "github.com" = {
        identityFile = "~/.ssh/github_key";
      };

      "heimdall" = {
        hostname = "heimdall.tails";
        user = "root";
        identityFile = "~/.ssh/heimdall_key";
      };

      "jellyfin" = {
        hostname = "jellyfin.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "jellyseerr" = {
        hostname = "jellyseerr.tails";
        user = "msviridov";
        identityFile = "~/.ssh/heimdall_key";
      };

      "opnsense" = {
        hostname = "opnsense.tails";
        user = "msviridov";
        identityFile = "~/.ssh/opnsense_key";
      };
    };
  };
}
