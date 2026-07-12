{ config, ... }: {
  flake.modules.nixos.b550 = { pkgs, user, ... }: {
    home-manager.users.${user} = {
      imports = with config.flake.modules.homeManager; [
        nh
        direnv
        bat
        zoxide
        ghostty
        zsh
        git
        stylix
        noctalia
        zen
        fastfetch
        starship
        obsidian
        nixcord
        lazygit
        zed
        nvf
        vicinae
      ];

      home = {
        packages = with pkgs; [
          nautilus
          pwvucontrol
          overskride
        ];

        stateVersion = "26.05";
      };
    };
  };
}
