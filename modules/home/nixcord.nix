{ inputs, ... }: {
  flake.modules.homeManager.nixcord = { user, ... }: {
    imports = [
      inputs.nixcord.homeModules.nixcord
    ];

    programs.nixcord = {
      enable = true;

      vesktop.enable = true;
      discord.vencord.enable = true;
    };
  };
}
