{
  config,
  user,
  ...
}: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;

    casks = [
      "actual"
      "aerospace"
      "anki"
      "brave-browser"
      "ente-auth"
      "flux-app"
      "jordanbaird-ice"
      "karabiner-elements"
      "localsend"
      "logi-options+"
      "mqtt-explorer"
      "notion"
      "obsidian"
      "proton-drive"
      "raycast"
      "rustdesk"
      "the-unarchiver"
      "todoist-app"
      "vlc"
      "winbox"
      "zen"
    ];

    masApps = {
      "Bitwarden" = 1352778147;
    };

    global.autoUpdate = false;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = builtins.attrNames config.nix-homebrew.taps;
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    autoMigrate = true;
    user = user;
  };
}
