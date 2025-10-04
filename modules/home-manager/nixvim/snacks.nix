{pkgs, ...}: {
  programs.nixvim.plugins.snacks = {
    enable = true;

    settings = {
      bigfile.enabled = true;
      dim.enabled = true;
      indent.enabled = true;
      input.enable = true;
      notifier.enabled = true;
      picker = {
        enabled = true;
        db.sqlite3_path = "${pkgs.sqlite.out}/lib/libsqlite3.so";
      };
      quickfile.enabled = true;
      scope.enabled = true;
      scroll.enabled = false;
      statuscolumn.enabled = true;
      toggle.enabled = true;
      words.enabled = true;
      zen.enabled = true;
    };
  };
}
