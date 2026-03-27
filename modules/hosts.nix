{
  # msviridov user at fw-laptop host.
  den.hosts.x86_64-linux.fw-laptop.users.msviridov.classes = ["homeManager"];

  # define an standalone home-manager for msviridov
  den.homes.x86_64-linux.msviridov = {};

  # be sure to add nix-darwin input for this:
  # den.hosts.aarch64-darwin.apple.users.alice = { };
}
