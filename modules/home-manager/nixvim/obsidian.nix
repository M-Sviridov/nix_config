{config, ...}: {
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      legacy_commands = false;

      workspaces = [
        {
          name = "my_second_brain";
          path = "${config.home.homeDirectory}/my_second_brain";
        }
      ];

      notes_subdir = "notes/inbox";

      daily_notes = {
        folder = "notes/dailies";
        date_format = "%Y-%m-%d";
        alias_format = "%B %-d, %Y";
      };

      completion = {
        nvim-cmp = false;
        blink_cmp = true;
        min_chars = 2;
        create_new = true;
      };

      new_notes_location = "notes_subdir";

      note_id_func = {
        __raw = "function(title)
          local suffix = ''
          if title ~= nil then
            suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
          else
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.date '%Y-%m-%d') .. '-' .. suffix
        end";
      };

      note_path_func = {
        __raw = "function(spec)
          local path = spec.dir / tostring(spec.id)
          return path:with_suffix('.md ')
         end";
      };

      templates = {
        folder = "vault_management/templates";
        date_format = "%Y-%m-%d";
        time_format = "%H:%M";
      };

      picker.name = "snacks.pick";

      backlinks.parse_headers = false;
      sort_by = "modified";
      sort_reverse = true;
      search_max_lines = 1000;
      open_notes_in = "current";
    };
  };
}
