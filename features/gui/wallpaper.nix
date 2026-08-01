{
  flake.modules.nixos.wallpaper = {
    home-manager.sharedModules = [
      {
        services.linux-wallpaperengine = {
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
      }
    ];
  };

  flake.modules.darwin.wallpaper = {
    home-manager.sharedModules = [
      {
        programs.desktoppr = {
          enable = true;
          settings = {
            picture = "https://w.wallhaven.cc/full/9o/wallhaven-9o833w.jpg";
          };
        };
      }
    ];
  };
}
