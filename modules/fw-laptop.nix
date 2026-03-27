{
  # host aspect
  den.aspects.fw-laptop = {
    # host NixOS configuration
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        neovim
        tree
      ];
    };

    # host provides default home environment for its users
    homeManager = {pkgs, ...}: {
      # home.packages = [pkgs.vim];
    };
  };
}
