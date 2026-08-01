{ config, ... }: {
  flake.modules.homeManager.bat = { pkgs, ... }: {
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batman ];

      config = {
        style = "grid,numbers";
      };
    };
  };

  flake.modules.nixos.bat = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      bat
    ];
  };

  flake.modules.darwin.bat = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      bat
    ];
  };
}
