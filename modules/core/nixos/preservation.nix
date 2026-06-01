{ lib, config, ...}: {
  options.flake.custom = {
    persist = {
      root = {
        directories = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
        files = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
      };

      home = {
        directories = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
        files = lib.mkOption {
          type = with lib.types; listOf anything;
          default = [];
        };
      };
    };
  };

  config.flake.modules.nixos.preservation = { user, ... }: {
    preservation = let
      cfg = config.flake.custom.persist;
    in {
      enable = true;

      preserveAt."/persistent" = {
        commonMountOptions = [ "x-gvfs-hide" ];

        inherit (cfg.root) directories;
        inherit (cfg.root) files;

        users.${user} = {
          inherit (cfg.home) directories;
          inherit (cfg.home) files;
        };
      };
    };
  };
}
