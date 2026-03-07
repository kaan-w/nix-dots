{
  flake.templates = builtins.mapAttrs
    (name: _: { path = ../templates/${name}; description = ""; })
    (builtins.readDir ../templates);
}
