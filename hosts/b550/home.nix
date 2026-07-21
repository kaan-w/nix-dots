{ config, ... }: {
  flake.modules.nixos.b550 = { pkgs, user, ... }: {
    home-manager.users.${user} = {
      imports = with config.flake.modules.homeManager; [
        stylix
      ];

      home = {
        packages = with pkgs; [
          pwvucontrol
          overskride
        ];

        stateVersion = "26.05";
      };
    };
  };
}
