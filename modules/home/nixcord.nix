{ inputs, ... }: {
  flake.modules.homeManager.nixcord = { user, lib, pkgs, ... }: {
    imports = [
      inputs.nixcord.homeModules.nixcord
    ];

    programs.nixcord = {
      enable = true;
      inherit user;

      vesktop = {
        enable = true;
      };
    };
  };
}
