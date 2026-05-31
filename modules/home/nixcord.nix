{ inputs, ... }: {
  flake.modules.homeManager.nixcord = { user, ... }: {
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
