let
  sharedConfig = { host, ... }: {
    networking.hostName = host;
  };
in {
  flake.modules.nixos.networking = {
    imports = [ sharedConfig ];
  };

  flake.modules.darwin.networking = {
    imports = [ sharedConfig ];
  };
}
