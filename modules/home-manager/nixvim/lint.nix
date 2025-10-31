{pkgs, ...}: {
  home.packages = with pkgs; [
    shellcheck
    vale
    yamllint
  ];
  programs.nixvim.plugins.lint = {
    enable = true;

    lintersByFt = {
      ansible = ["ansible_lint"];
      bash = ["shellcheck"];
      markdown = ["vale"];
      sh = ["shellcheck"];
      text = ["text"];
      yaml = ["yamllint"];
    };
  };
}
