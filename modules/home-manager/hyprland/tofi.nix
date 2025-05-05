{user, ...}: {
  programs.tofi = {
    enable = true;
    settings = {
      anchor = "top";
      ascii-input = false;
      background-color = "#1e1e2e";
      border-color = "#cba6f7";
      border-width = 2;
      corner-radius = 8;
      font = "/home/${user}/.local/share/fonts/MapleMono-NF-Regular.ttf";
      font-size = 14;
      height = 40;
      hint-font = false;
      horizontal = true;
      matching-algorithm = "fuzzy";
      margin-top = 0;
      min-input-width = 120;
      outline-color = "#cba6f7";
      outline-width = 0;
      padding-top = 2;
      padding-bottom = 0;
      padding-left = 10;
      padding-right = 0;
      prompt-color = "#f9e2af";
      prompt-text = " Run: ";
      prompt-padding = 5;
      result-spacing = 15;
      selection-color = "#f38ba8";
      tect-color = "#cdd6f4";
      width = "99%";
    };
  };
}
