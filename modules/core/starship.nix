{...}: {
  programs = {
    starship = {
      enable = true;
      presets = ["pure-preset"];
      settings = {
        add_newline = false;
      };
    };
  };
}
