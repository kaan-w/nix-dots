{
  flake.modules.homeManager.lazygit = {
    programs.lazygit = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
