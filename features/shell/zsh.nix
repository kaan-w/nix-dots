let
  sharedConfig = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;

      histSize = 5000;

      shellAliases = {
        "ff" = "fastfetch";
      };
    };
  };
in {
  flake.modules.nixos.zsh = { pkgs, user, ... }: {
    imports = [ sharedConfig ];

    programs.zsh = {
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      histFile = "$XDG_DATA_HOME/zsh/zsh_history";
      setOptions = [
        "HIST_IGNORE_ALL_DUPS"
      ];

      loginShellInit = ''
        if uwsm check may-start; then
          exec uwsm start niri-uwsm.desktop
        fi
      '';
    };

    users.users.${user}.shell = pkgs.zsh;
  };

  flake.modules.darwin.zsh = {
    imports = [ sharedConfig ];

    programs.zsh = {
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      enableFzfHistory = true;
    };
  };

  flake.custom.persist = {
    home.directories = [
      ".local/share/zsh"
    ];
  };
}
