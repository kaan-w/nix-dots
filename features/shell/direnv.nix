{ config, ... }: {
  flake.modules.homeManager.direnv = {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;

      silent = true;
      config = {
        global = {
          hide_env_diff = true;
        };
      };
    };
  };

  flake.modules.nixos.direnv = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      direnv
    ];

    custom.persist = {
      home.directories = [ ".local/share/direnv" ];
    };
  };

  flake.modules.darwin.direnv = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      direnv
    ];
  };
}
