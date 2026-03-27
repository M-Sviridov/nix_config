{
  inputs,
  den,
  ...
}: {
  imports = [(inputs.den.namespace "my" false)];
  _module.args.__findFile = den.lib.__findFile;
}
