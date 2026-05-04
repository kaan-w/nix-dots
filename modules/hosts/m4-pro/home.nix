{ config, inputs, ... }: {
  flake.modules.darwin.m4-pro = { pkgs, user, ... }: {
    home-manager.users.${user} = {
      imports = with config.flake.modules.homeManager; [
        bat
        direnv
        ghostty
        nh
        vscode
        zed
        zoxide
        git
        zsh
        stylix
        fastfetch
        firefox
        zen
        starship
        obsidian
      ];

      home = {
        packages = with pkgs; [
          mas
          nix-prefetch
          notion-app
        ];

        activation.setWallpaper = inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] (let
          wallpaper = pkgs.fetchurl (builtins.elemAt config.flake.wallpapers 2);
        in ''
          $DRY_RUN_CMD ${pkgs.desktoppr}/bin/desktoppr ${wallpaper}
        '');

        stateVersion = "26.05";
      };
    };
  };
}
