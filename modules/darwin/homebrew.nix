{
  config,
  user,
  ...
}: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;

    brews = [
      "ansible-language-server"
      "homebrew-zathura/zathura/zathura-pdf-mupdf"
    ];

    casks = [
      "actual"
      "aerospace"
      "anki"
      "beekeeper-studio"
      "brave-browser"
      "bruno"
      "ente-auth"
      "flux-app"
      "jordanbaird-ice"
      "karabiner-elements"
      "libreoffice"
      "localsend"
      "logi-options+"
      "mqtt-explorer"
      "notion"
      "obsidian"
      "proton-drive"
      "protonvpn"
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
