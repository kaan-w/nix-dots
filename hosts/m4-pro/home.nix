{ config, inputs, ... }: {
  flake.modules.darwin.m4-pro = { pkgs, lib, user, wallpaper, ... }: {
    home-manager.users.${user} = {
      imports = with config.flake.modules.homeManager; [
        stylix
      ];

      home = {
        packages = with pkgs; [
          mas
          nix-prefetch
        ];

        activation.setWallpaper = inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          $DRY_RUN_CMD ${lib.getExe pkgs.desktoppr} ${wallpaper}
        '';

        stateVersion = "26.05";
      };
    };
  };
}
