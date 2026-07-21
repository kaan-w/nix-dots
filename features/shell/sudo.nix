let
  sharedConfig = {
    security.sudo = {
      extraConfig = ''
        Defaults lecture=never
        Defaults pwfeedback
      '';
    };
  };
in {
  flake.modules.nixos.sudo = {
    imports = [ sharedConfig ];

    security.sudo.enable = true;
  };

  flake.modules.darwin.sudo = {
    imports = [ sharedConfig ];
  };
}
