{ config, ... }: {
  flake.modules.homeManager.zsh = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 5000;
        ignoreAllDups = true;
        path = "$XDG_DATA_HOME/zsh/zsh_history";
      };

      shellAliases = {
        ff = "fastfetch";
      };
    };
  };

  flake.modules.nixos.zsh = { pkgs, user, ... }: {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      zsh
      {
        programs.zsh.initContent = ''
          if uwsm check may-start; then
            exec uwsm start niri-uwsm.desktop
          fi
        '';
      }
    ];

    programs.zsh.enable = true;
    users.users.${user}.shell = pkgs.zsh;
  };

  flake.custom.persist = {
    home.directories = [
      ".local/share/zsh"
    ];
  };
}
