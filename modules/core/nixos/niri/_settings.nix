{ wallpaper }: {
  wayland.windowManager.niri.settings = {
    prefer-no-csd = true;

    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = true;
    };

    spawn-at-startup = [
      [ "swaybg" "-i" "${wallpaper}" ]
    ];

    output = [{
      _args = [ "DP-3" ];
      mode = "1920x1080@144";
    }];

    input = {
      keyboard = {
        xkb = {
          layout = "us,tr";
        };
      };
    };

    layout = {
      gaps = 16;

      border.width = 4;
      focus-ring.off = [];

      center-focused-column = "on-overflow";
      always-center-single-column = true;

      preset-column-widths._children = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      preset-window-heights._children = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      background-color = "transparent";
    };

    overview.workspace-shadow.off = [];

    window-rule = [
      {
        geometry-corner-radius = 10;
        draw-border-with-background = false;
        clip-to-geometry = true;
      }
    ];

    layer-rule = [
      {
        match._props.namespace = "^wallpaper$";
        place-within-backdrop = true;
      }
    ];
  };
}
