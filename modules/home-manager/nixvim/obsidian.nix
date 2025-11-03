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

      frontmatter = {
        enabled = true;
        func = {
          __raw = "function(note)
            local out = {
              date = os.date('%Y-%m-%d'),
              id = note.id, 
              -- aliases = note.aliases, 
              tags = note.tags }

            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
              for k, v in pairs(note.metadata) do
                out[k] = v
              end
            end
            return out
          end";
        };
        sort = ["date" "id" "aliases" "tags"];
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
          return suffix
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
