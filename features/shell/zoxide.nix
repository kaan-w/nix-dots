{
  flake.modules.homeManager.zoxide = {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
  };

  flake.custom.persist = {
    home.directories = [
      ".local/share/zoxide"
    ];
  };
}
