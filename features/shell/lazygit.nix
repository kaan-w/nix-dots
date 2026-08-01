{ config, ... }: {
  flake.modules.homeManager.lazygit = {
    programs.lazygit = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  flake.modules.nixos.lazygit = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      lazygit
    ];
  };

  flake.modules.darwin.lazygit = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      lazygit
    ];
  };
}
