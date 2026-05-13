{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-parts.url = "github:hercules-ci/flake-parts";
    typix = {
      url = "github:loqusion/typix";
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

      perSystem = { system, pkgs, ... }: let
        typix-lib = inputs.typix.lib.${system};
        src = typix-lib.cleanTypstSource ./.;
        commonArgs = {
          typstSource = "main.typ";
          fontPaths = [];
          virtualPaths = [];
        };
        build-drv = typix-lib.buildTypstProject (commonArgs // { inherit src; });
        build-script = typix-lib.buildTypstProjectLocal (commonArgs // { inherit src; });
        watch-script = typix-lib.watchTypstProject commonArgs;
      in {
        packages.default = build-drv;

        checks = {
          inherit build-drv build-script watch-script;
        };

        apps = rec {
          default = watch;
          build.program = build-drv;
          watch.program = watch-script;
        };

        devShells.default = typix-lib.devShell {
          inherit (commonArgs) fontPaths virtualPaths;
          packages = with pkgs; [
            watch-script
            tinymist
            nixd
            nil
          ];
        };
      };
    };
}
