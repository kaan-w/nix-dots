{ config, ... }: {
  flake.modules.darwin.m4-pro = { pkgs, user, ... }: {
    home-manager.users.${user} = {
      imports = with config.flake.modules.homeManager; [
        stylix
      ];

      home = {
        packages = with pkgs; [
          mas
          nix-prefetch
        ];

        stateVersion = "26.05";
      };
    };
  };
}
