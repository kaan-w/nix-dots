{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-parts.url = "github:hercules-ci/flake-parts";

    zig = {
      url = "github:silversquirl/zig-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zls = {
      url = "github:zigtools/zls";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem = { pkgs, inputs', ... }: {
        packages.default = inputs'.zig.packages.default.makePackage {
          pname = "my-project";
          version = "0.1.0";
          src = pkgs.lib.cleanSource ./.;
          depsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
        };

        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            nixd
            nil
            inputs'.zig.packages.nightly
            inputs'.zls.packages.zls
          ];
        };
      };
    };
}
