{ config, ... }: {
  flake.nixosConfigurations = builtins.mapAttrs (
    host: params: config.flake.lib.mkHost ({ inherit host; } // params)
  ) {
    iso = { system = "x86_64-linux"; iso = true; };
    b550 = { system = "x86_64-linux"; };
  };
}
