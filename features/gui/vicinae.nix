{ inputs, ... }: {
  flake.modules.homeManager.vicinae = { pkgs, ...}: let
    system = pkgs.stdenv.hostPlatform.system;
  in {
    home.packages = with pkgs; [
      pulseaudio
      sqlite
      playerctl
    ];

    programs.vicinae = {
      enable = true;

      systemd = {
        enable = true;
        autoStart = true;
      };

      extensions = with inputs.vicinae-extensions.packages.${system}; [
        bluetooth
        nix
        zed-recents
        process-manager
        pulseaudio
        player-pilot
        color-converter
      ];

      settings = {
        close_on_focus_loss = true;
        consider_preedit = true;
        pop_to_root_on_close = true;

        font.normal.size = 11;
        launcher_window = {
          opacity = 0.85;
          blur.enabled = false;
        };
      };
    };
  };

  flake.custom.persist = {
    home.directories = [
      ".local/share/vicinae"
      ".cache/vicinae"
    ];
  };
}
