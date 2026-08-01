{ config, ... }: {
  flake.modules.nixos.gui_bundle = {
    imports = with config.flake.modules.nixos; [
      zen-browser
      zed-editor
      niri
      ghostty
      obsidian
      vicinae
      wallpaper
    ];
  };

  flake.modules.darwin.gui_bundle = {
    imports = with config.flake.modules.darwin; [
      zen-browser
      zed-editor
      ghostty
      obsidian
      wallpaper
    ];
  };
}
