{
  flake.modules.homeManager.zsh = { config, pkgs, lib, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 5000;
        ignoreAllDups = true;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
      };

      shellAliases = {
        ff = "fastfetch";
      };

      initContent = lib.mkIf pkgs.stdenv.isLinux ''
        if uwsm check may-start; then
          exec uwsm start niri-uwsm.desktop
        fi
      '';
    };
  };
}
