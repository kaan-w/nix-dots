{ config, ... }: {
  flake.modules.homeManager.starship = {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  flake.modules.nixos.starship = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      starship
    ];
  };

  flake.modules.darwin.starship = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      starship
    ];
  };
}
