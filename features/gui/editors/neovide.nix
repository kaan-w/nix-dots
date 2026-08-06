{ config, ... }: {
  flake.modules.homeManager.neovide = { lib, ... }: {
    programs.neovide = {
      enable = true;
      settings = {
        font = {
          size = lib.mkForce 18;
          features."JetBrainsMono Nerd Font" = [ "+zero" ];
        };
      };
    };
  };

  flake.modules.nixos.neovide = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      neovide
    ];
  };

  flake.modules.darwin.neovide = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      neovide
    ];
  };
}
