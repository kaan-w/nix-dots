{ config, inputs, ... }: {
  flake.modules.darwin.m4-pro = { pkgs, lib, user, wallpaper, ... }: {
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
        lazygit
        nixcord
      ];

      home = {
        packages = with pkgs; [
          mas
          nix-prefetch
          notion-app
        ];

        activation.setWallpaper = inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          $DRY_RUN_CMD ${lib.getExe pkgs.desktoppr} ${wallpaper}
        '';

        stateVersion = "26.05";
      };
    };
  };
}
