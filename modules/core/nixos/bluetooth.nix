{
  flake.modules.nixos.bluetooth = {
    # https://nixos.wiki/wiki/Bluetooth#Enabling_Bluetooth_support
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}
