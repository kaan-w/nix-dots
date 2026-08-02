{ config, ... }: {
  flake.modules.homeManager.ghostty = {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        window-padding-x = 14;
        window-padding-y = "0,6";
        macos-titlebar-style = "hidden";
        confirm-close-surface = false;
        font-feature = "+zero";
        font-size = 16;
      };
    };
  };

  flake.modules.nixos.ghostty = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      ghostty
    ];
  };

  flake.modules.darwin.ghostty = { pkgs, ... }: {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      ghostty
      {
        programs.ghostty.package = pkgs.ghostty-bin;
      }
    ];
  };
}
