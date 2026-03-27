{inputs, ...}: {
  my.ghostty.homeManager = {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        font-family = ["Maple Mono NF" "Noto Sans Thai"];
        font-feature = ["calt" "cv01" "ss05" "ss08"];
        font-size = 12;
      };
    };
  };
}
