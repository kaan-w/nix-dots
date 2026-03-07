{ config, ... }: {
  flake.nixosConfigurations = builtins.mapAttrs (
    host: params: config.flake.lib.mkHost ({ inherit host; } // params)
  ) {
    b550 = { system = "x86_64-linux"; };
  };
}
