{ config, ... }: {
  flake.modules.homeManager.fzf = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  flake.modules.nixos.fzf = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      fzf
    ];
  };

  flake.modules.darwin.fzf = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      fzf
    ];
  };
}
