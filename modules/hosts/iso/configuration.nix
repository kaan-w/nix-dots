{ config, ... }: {
  flake.modules.nixos.iso = { pkgs, ... }: {
    imports = [
      config.flake.modules.generic.nix
    ];

    image.modules."iso-installer" = {
      isoImage.squashfsCompression = "gzip -Xcompression-level 1";

      environment.systemPackages = with pkgs; [
        neovim
        disko
      ];
    };
  };

  perSystem = {
    packages.iso = config.flake.nixosConfigurations.iso.config.system.build.images."iso-installer";
  };
}
