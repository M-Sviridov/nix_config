{...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-size = 11;
      font-family = "Maple Mono NF";
      font-feature = "calt cv01 ss05 ss08";
      window-padding-x = 5;
      window-padding-y = 0;
    };
  };
}
