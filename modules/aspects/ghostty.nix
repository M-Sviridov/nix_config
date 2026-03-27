{inputs, ...}: {
  my.ghostty.homeManager = {
    programs.ghostty = {
      enable = true;
      settings = {
        font-family = "Maple Mono NF";
	font-feature = ["calt" "cv01" "ss05" "ss08"];
        font-size = 12;
      };
    };
  };
}
