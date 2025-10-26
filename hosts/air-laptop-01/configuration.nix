{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    alejandra
    fnm
    mas
    # neovim
    nixd
    prettier
    rustc
    vale
    vivid
  ];

  fonts.packages = with pkgs; [
    corefonts
    font-awesome
    maple-mono.NF-unhinted
    material-icons
    nerd-fonts.noto
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  homebrew = {};

  networking = {
    computerName = "air-laptop-01";
    hostName = "air-laptop-01";
    localHostName = "air-laptop-01";
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
  };

  # necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  # set git commit hash for darwin-version.
  system.configurationRevision = config.rev or config.dirtyrev or null;

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      enable-spring-load-actions-on-all-items = true;
      expose-animation-duration = 0.0;
      launchanim = false;
      magnification = false;
      minimize-to-application = false;
      mru-spaces = false;
      orientation = "bottom";
      show-process-indicators = true;
      show-recents = false;
      showhidden = true;
      static-only = true;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
    };

    finder = {
      _FXSortFoldersFirst = true;
      _FXSortFoldersFirstOnDesktop = true;
      AppleShowAllExtensions = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "sccf";
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "clmv";
      NewWindowTarget = "Home";
      QuitMenuItem = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
      ShowStatusBar = true;
    };

    hitoolbox.AppleFnUsageType = "Change Input Source";

    iCal = {
      "first day of week" = "Monday";
      "TimeZone support enabled" = true;
      CalendarSidebarShown = true;
    };

    LaunchServices.LSQuarantine = false;

    loginwindow = {
      DisableConsoleAccess = true;
      GuestEnabled = false;
    };

    menuExtraClock = {
      ShowDate = 2;
      ShowDayOfWeek = false;
    };

    NSGlobalDomain = {
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.springing.delay" = 0.5;
      "com.apple.springing.enabled" = true;
      AppleInterfaceStyle = "Dark";
      AppleMetricUnits = 1;
      ApplePressAndHoldEnabled = false;
      AppleScrollerPagingBehavior = true;
      AppleShowScrollBars = "WhenScrolling";
      AppleTemperatureUnit = "Celsius";
      InitialKeyRepeat = 10;
      KeyRepeat = 1;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticWindowAnimationsEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSScrollAnimationEnabled = true;
      NSTextShowsControlCharacters = true;
      NSUseAnimatedFocusRing = false;
      NSWindowShouldDragOnGesture = true;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
    };

    screencapture = {
      disable-shadow = true;
      include-date = true;
      location = "/Users/msviridov/Pictures/screenshots";
      show-thumbnail = false;
      target = "clipboard";
    };

    screensaver.askForPassword = true;

    smb = {
      NetBIOSName = "air-laptop-01";
      ServerDescription = "air-laptop-01";
    };
  };

  system.startup.chime = false;

  # used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  system.primaryUser = "msviridov";

  time.timeZone = "Asia/Bangkok";

  # the platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
