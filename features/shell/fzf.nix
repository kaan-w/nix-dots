{
  flake.modules.homeManager.fzf = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
