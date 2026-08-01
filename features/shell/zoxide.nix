{ config, ... }: {
  flake.modules.homeManager.zoxide = {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
  };

  flake.modules.nixos.zoxide = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      zoxide
    ];

    custom.persist = {
      home.directories = [
        ".local/share/zoxide"
      ];
    };
  };

  flake.modules.darwin.zoxide = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      zoxide
    ];
  };
}
