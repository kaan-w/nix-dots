{
  flake.modules.nixos.sudo = {
    security.sudo = {
      enable = true;
      extraConfig = ''
        Defaults lecture=never
      '';
    };
  };
}
