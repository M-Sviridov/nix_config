{
  config,
  inputs,
  user,
  ...
}: {
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;

    brews = [
      "ansible-language-server"
      "borders"
      "homebrew-zathura/zathura/zathura-pdf-mupdf"
    ];

    casks = [
      "actual"
      "aerospace"
      "anki"
      "beekeeper-studio"
      "brave-browser"
      "bruno"
      "discord"
      "docker-desktop"
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
      "plexamp"
      "proton-drive"
      "protonvpn"
      "qbittorrent"
      "raycast"
      "rustdesk"
      "signal"
      "the-unarchiver"
      "todoist-app"
      "vlc"
      "winbox"
      "xnviewmp"
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

    taps =
      builtins.attrNames config.nix-homebrew.taps
      ++ [
        "nikitabobko/tap"
      ];
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    autoMigrate = true;

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    user = user;
  };
}
