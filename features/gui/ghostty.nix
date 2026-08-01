{ config, ... }: {
  flake.modules.homeManager.ghostty = { pkgs, ... }: {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      package = with pkgs; if stdenv.isDarwin then ghostty-bin else ghostty;

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

  flake.modules.darwin.ghostty = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      ghostty
    ];
  };
}
