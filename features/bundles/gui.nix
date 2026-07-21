{ config, ... }: {
  flake.modules.homeManager.gui_bundle = {
    imports = with config.flake.modules.homeManager; [
      zen-browser
      zed-editor
      ghostty
      obsidian
    ];
  };

  flake.modules.nixos.gui_bundle = {
    imports = with config.flake.modules.nixos; [
      niri
    ];

    home-manager.sharedModules = with config.flake.modules.homeManager; [
      gui_bundle
      vicinae
    ];
  };

  flake.modules.darwin.gui_bundle = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      gui_bundle
    ];
  };
}
