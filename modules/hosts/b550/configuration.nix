{ config, ... }: {
  flake.modules.nixos.b550 = {
    imports = with config.flake.modules.nixos; [
      config.flake.modules.generic.nix
      config.flake.modules.generic.networking
      systemd-boot
      gvfs
      bluetooth
      pipewire
      users
    ];

    # https://nixos.wiki/wiki/AMD_GPU#Make_the_kernel_use_the_correct_driver_early
    boot.initrd.kernelModules = [ "amdgpu" ];

    # https://wiki.nixos.org/wiki/AMD_GPU#Basic_Setup
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    system.stateVersion = "26.05";
  };
}
