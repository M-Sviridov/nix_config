{hostname, ...}: let
  machines = {
    air-laptop-01 = {
      dpi = 144.0;
      fontSize = 13.0;
      windowDecorations = "RESIZE";
    };

    loki = {
      dpi = 384.0;
      fontSize = 11.0;
      windowDecorations = "NONE";
    };
  };

  settings = machines.${hostname};
in {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action

      if wezterm.config_builder then
        config = wezterm.config_builder()
      else
        config = {}
      end

      -- Host specific settings
      config.font_size = ${toString settings.fontSize}
      config.dpi = ${toString settings.dpi}
      config.window_decorations = "${settings.windowDecorations}"

      -- Shared settings
      config.font = wezterm.font {
        family = 'Maple Mono NF',
        harfbuzz_features = { 'calt', 'cv01', 'ss05', 'ss08' },
        weight = 'Regular',
      }

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

      config.color_scheme = 'Catppuccin Mocha'

      config.max_fps = 144

      return config
    '';
  };
}
