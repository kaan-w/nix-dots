{ config, ... }: {
  flake.darwinConfigurations = builtins.mapAttrs (
    host: params: config.flake.lib.mkHost ({ inherit host; } // params)
  ) {
    m4-pro = { system = "aarch64-darwin"; };
  };
}
