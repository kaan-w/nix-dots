{
  flake.modules.nixos.b550 = { pkgs, user, ... }: {
    home-manager.users.${user} = {
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
