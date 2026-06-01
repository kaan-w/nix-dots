{ config, inputs, ... }: {
  flake.lib.mkHost = { host, system, iso ? false }: let
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    user = "kaanw";
    wallpaper = pkgs.fetchurl (builtins.elemAt config.flake.wallpapers 3);

    specialArgs = {
      inherit user host wallpaper;
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
        ] ++ pkgs.lib.optionals (!iso) [
          inputs.disko.nixosModules.default
          inputs.preservation.nixosModules.default

          inputs.home-manager.nixosModules.default
          commonHomeManagerModule
        ];
      }
    else if system == "aarch64-darwin" || system == "x86_64-darwin" then
      inputs.nix-darwin.lib.darwinSystem {
        inherit system pkgs specialArgs;

        modules = [
          inputs.home-manager.darwinModules.default
          commonHomeManagerModule

          config.flake.modules.darwin.${host}
        ];
      }
    else
      throw "Unsupported system";
}
