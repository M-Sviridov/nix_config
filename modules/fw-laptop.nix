{
  # host aspect
  den.aspects.fw-laptop = {
    # host NixOS configuration
    nixos = {pkgs, ...}: {
      services.upower.enable = true;

      environment.systemPackages = with pkgs; [
        tree
      ];
    };

    # host provides default home environment for its users
    # homeManager = {pkgs, ...}: {
    #   home.packages = [pkgs.bitwarden-desktop];
    # };
  };
}
