{ config, ... }: {
  flake.modules.homeManager.nh = { user, ... }: {
    programs.nh = {
      enable = true;
      osFlake = /home/${user}/Projects/nix-dots;
      darwinFlake = /Users/${user}/nix-dots;

      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 5 --keep-since 7d --optimise";
      };
    };
  };

  flake.modules.nixos.nh = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      nh
    ];
  };

  flake.modules.darwin.nh = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      nh
    ];
  };
}
