{ config, ... }: {
  flake.modules.nixos.b550 = { pkgs, user, ... }: {
    home-manager.users.${user} = {
      imports = with config.flake.modules.homeManager; [
        nh
        direnv
        bat
        vscode
        zoxide
        ghostty
        zsh
        git
        stylix
      ];

      home = {
        packages = with pkgs; [
          nautilus
          pwvucontrol
          overskride
        ];

        sessionVariables = {
          # https://wiki.nixos.org/wiki/Visual_Studio_Code#Wayland
          NIXOS_OZONE_WL = "1";
        };

        stateVersion = "26.05";
      };
    };
  };
}
