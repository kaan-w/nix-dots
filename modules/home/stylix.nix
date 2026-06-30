{ inputs, ... }: {
  flake.modules.homeManager.stylix = { pkgs, lib, wallpaper, ... }: {
    imports = [
      inputs.stylix.homeModules.stylix
    ];

    stylix = {
      enable = true;
      image = wallpaper;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";

      cursor = lib.mkIf pkgs.stdenv.isLinux {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };
      icons = lib.mkIf pkgs.stdenv.isLinux {
        enable = true;
        dark = "MoreWaita";
        package = pkgs.morewaita-icon-theme;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };

      overlays.enable = false;

      targets = {
        vscode.enable = false;
        zen-browser.enable = false;
        firefox.enable = false;
        zed.enable = false;
        obsidian.enable = false;
        nixcord.enable = false;
        nvf.enable = false;
        vicinae.enable = false;
      };
    };
  };
}
