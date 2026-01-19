{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.my.programs.wezterm;
in {
  options.my.programs.wezterm = {
    enable = mkEnableOption "WezTerm terminal emulator";

    fontSize = mkOption {
      type = types.float;
      default = 12.0;
      description = "Font size";
    };

    dpi = mkOption {
      type = types.float;
      default = 96.0;
      description = "Display DPI for font scaling";
    };

    windowDecorations = mkOption {
      type = types.enum ["FULL" "RESIZE" "NONE" "TITLE"];
      default = "FULL";
      description = "Window decoration style";
    };

    font = {
      family = mkOption {
        type = types.str;
        default = "Maple Mono NF";
        description = "Font family";
      };

      features = mkOption {
        type = types.listOf types.str;
        default = ["calt" "cv01" "ss05" "ss08"];
        description = "HarfBuzz font features";
      };

      weight = mkOption {
        type = types.str;
        default = "Regular";
        description = "Font weight";
      };
    };

    colorScheme = mkOption {
      type = types.str;
      default = "Catppuccin Mocha";
      description = "Color scheme name";
    };

    maxFps = mkOption {
      type = types.int;
      default = 144;
      description = "Maximum frames per second";
    };

    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Additional Lua configuration appended before return";
    };
  };

  config = mkIf cfg.enable {
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
        config.font_size = ${toString cfg.fontSize}
        config.dpi = ${toString cfg.dpi}
        config.window_decorations = "${cfg.windowDecorations}"

        -- Font settings
        config.font = wezterm.font {
          family = '${cfg.font.family}',
          harfbuzz_features = { ${concatMapStringsSep ", " (f: "'${f}'") cfg.font.features} },
          weight = '${cfg.font.weight}',
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
        config.color_scheme = '${cfg.colorScheme}'
        config.max_fps = ${toString cfg.maxFps}

        ${cfg.extraConfig}

        return config
      '';
    };
  };
}
