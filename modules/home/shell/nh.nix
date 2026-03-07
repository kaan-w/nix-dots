{
  flake.modules.homeManager.nh = { user, ... }: {
    programs.nh = {
      enable = true;
      osFlake = /home/${user}/nix-dots;
      darwinFlake = /Users/${user}/nix-dots;

      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 5 --keep-since 7d --optimise";
      };
    };
  };
}
