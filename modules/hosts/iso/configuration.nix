{ config, inputs, ... }: {
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

  perSystem = { system, ... }: {
    packages.iso = (inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [ config.flake.modules.nixos.iso ];
    }).config.system.build.images."iso-installer";
  };
}
