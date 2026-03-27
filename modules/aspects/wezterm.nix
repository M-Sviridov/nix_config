{inputs, ...}: {
  my.wezterm.homeManager = {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
       local wezterm = require 'wezterm'
       local act = wezterm.action

       -- Host specific settings
       config.font_size = 11.0
       config.dpi = 192.0
       config.window_decorations = "TITLE"

       config.font = wezterm.font {
          family = 'Maple Mono NF',
          harfbuzz_features = { "calt", "cv01", "ss05", "ss08" },
          weight = 'Regular',
        }

       -- Shared settings
       config.enable_tab_bar = false
       config.use_fancy_tab_bar = false

       config.mouse_bindings = {
	 {
	   event = { Down = { streak = 1, button = { WheelUp = 1 } } },
	   mods = 'NONE',
	   action = act.ScrollByLine(-3),
	 },
	 {
	   event = { Down = { streak = 1, button = { WheelDown = 1 } } },
	   mods = 'NONE',
	   action = act.ScrollByLine(3),
	 },
       }

       config.window_close_confirmation = 'NeverPrompt'

       return config
      '';
    };
  };
}
