{ config, ... }: {
  flake.modules.nixos.os_bundle = {
    imports = with config.flake.modules.nixos; [
      bluetooth
      gvfs
      i18n
      networking
      pipewire
      systemd-boot
      users
    ];
  };

  flake.modules.darwin.os_bundle = {
    imports = with config.flake.modules.darwin; [
      i18n
      macos
      networking
      users
    ];
  };
}
