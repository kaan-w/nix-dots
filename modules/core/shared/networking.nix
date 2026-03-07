{
  flake.modules.generic.networking = { host, ... }: {
    networking.hostName = host;
  };
}
