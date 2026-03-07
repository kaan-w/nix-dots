{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-parts.url = "github:hercules-ci/flake-parts";
    rust-flake.url = "github:juspay/rust-flake";
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.rust-flake.flakeModules.default
        inputs.rust-flake.flakeModules.nixpkgs
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem = { config, pkgs, ... }: let
        crane-lib = config.rust-project.crane-lib;
        cargo-toml = crane-lib.crateNameFromCargoToml { cargoToml = ./Cargo.toml; };
        pname = cargo-toml.pname;
      in {
        packages.default = config.packages.${pname};

        checks = {
          clippy = config.rust-project.crates.${pname}.crane.outputs.drv.clippy;
        };

        devShells.default = crane-lib.devShell {
          packages = with pkgs; [
            nixd
            nil
          ];

          checks = config.checks;
        };
      };
    };
}
