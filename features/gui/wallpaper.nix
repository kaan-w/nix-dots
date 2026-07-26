{
  flake.modules.homeManager.wallpaper = { pkgs, lib, ... }: {
    services.linux-wallpaperengine = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      wallpapers = [
        {
          monitor = "DP-3";
          wallpaperId = "3772195227";
          fps = 30;
          audio = {
            silent = true;
            processing = false;
          };
        }
      ];
    };

    programs.desktoppr = lib.mkIf pkgs.stdenv.isDarwin {
      enable = true;
      settings = {
        picture = "https://w.wallhaven.cc/full/9o/wallhaven-9o833w.jpg";
      };
    };
  };
}
