{ config, ... }: {
  flake.modules.nixos.os_bundle = {
    imports = with config.flake.modules.nixos; [
      bluetooth
      gvfs
      networking
      pipewire
      systemd-boot
      users
    ];
  };

  flake.modules.darwin.os_bundle = {
    imports = with config.flake.modules.darwin; [
      macos
      networking
      users
    ];
  };
}
