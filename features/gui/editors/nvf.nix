{ inputs, ... }: {
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
}
