{...}: {
  programs.fw-fanctrl = {
    enable = true;
    config.defaultStrategy = "lazy";
  };
}
