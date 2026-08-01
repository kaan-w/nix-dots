{ inputs, config, ... }: {
  flake.modules.homeManager.nvf = { pkgs, ... }:{
    imports = [
      inputs.nvf.homeManagerModules.default
    ];

    programs.nvf = {
      enable = true;
      settings.vim = {
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        telescope.enable = true;
        extraPlugins = {
          smear-cursor = {
            package = pkgs.vimPlugins.smear-cursor-nvim;
            setup = "require('smear_cursor').enabled = true";
          };
        };
      };
    };
  };

  flake.modules.nixos.nvf = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      nvf
    ];
  };

  flake.modules.darwin.nvf = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      nvf
    ];
  };
}
