{ config, inputs, ... }: {
  flake.modules.homeManager.stylix = { pkgs, lib, ... }: {
    imports = [
      inputs.stylix.homeModules.stylix
    ];

    stylix = {
      enable = true;
      image = pkgs.fetchurl (builtins.elemAt config.flake.wallpapers 2);
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
      };
    };
  };
}
