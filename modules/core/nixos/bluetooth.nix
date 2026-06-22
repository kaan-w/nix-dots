{
  flake.modules.nixos.bluetooth = {
    # https://nixos.wiki/wiki/Bluetooth#Enabling_Bluetooth_support
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };

  flake.custom.persist = {
    root.directories = [
      "/var/lib/bluetooth"
    ];
  };
}
