let
  sharedConfig = {
    time.timeZone = "Europe/Istanbul";
  };
in {
  flake.modules.nixos.i18n = {
    imports = [ sharedConfig ];

    i18n.defaultLocale = "en_US.UTF-8";
  };

  flake.modules.darwin.i18n = {
    imports = [ sharedConfig ];
  };
}
