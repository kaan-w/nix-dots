{ config, inputs, ... }: {
  flake.lib.mkHost = { host, system }: let
    user = "kaanw";

    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    specialArgs = {
      inherit user host;
    };

    commonHomeManagerModule = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = specialArgs;
    };
  in
    if system == "x86_64-linux" || system == "aarch64-linux" then
      inputs.nixpkgs.lib.nixosSystem {
        inherit system pkgs specialArgs;

        modules = [
          config.flake.modules.nixos.${host}

          inputs.home-manager.nixosModules.home-manager
          commonHomeManagerModule
        ];
      }
    else
      inputs.nix-darwin.lib.darwinSystem {
        inherit system pkgs specialArgs;

        modules = [
          config.flake.modules.darwin.${host}

          inputs.home-manager.darwinModules.home-manager
          commonHomeManagerModule

          inputs.nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              inherit (specialArgs) user;
              taps = {
                "homebrew/homebrew-core" = inputs.homebrew-core;
                "homebrew/homebrew-cask" = inputs.homebrew-cask;
              };
              mutableTaps = false;
            };
          }
          # Optional: Align homebrew taps config with nix-homebrew
          ({ config, ... }: {
            homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
          })
        ];
      };
}
