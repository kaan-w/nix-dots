{
  flake.modules.homeManager.direnv = {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      
      silent = true;
      config = {
        global = {
          hide_env_diff = true;
        };
      };
    };
  };

  flake.custom.persist = {
    home.directories = [ ".local/share/direnv" ];
  };
}
