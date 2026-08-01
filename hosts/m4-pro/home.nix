{
  flake.modules.darwin.m4-pro = { pkgs, user, ... }: {
    home-manager.users.${user} = {
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
