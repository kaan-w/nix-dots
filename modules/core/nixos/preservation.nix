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

        directories = [
          "/var/log"
          "/var/lib/nixos"
        ] ++ cfg.root.directories;

        files = [
          "/etc/machine-id"
        ] ++ cfg.root.files;

        users.${user} = {
          directories =  [
            ".ssh"
            "Documents"
            "Downloads"
            "Pictures"
            "Videos"
            "Projects"
          ] ++ cfg.home.directories;
          inherit (cfg.home) files;
        };
      };
    };
  };
}
