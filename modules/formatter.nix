{ pkgs, ...}: {
  perSystem = { ... }: {
    formatter = pkgs.alejandra;
  };
}
