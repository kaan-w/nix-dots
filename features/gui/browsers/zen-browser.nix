{ inputs, config, ... }: {
  flake.modules.homeManager.zen-browser = { pkgs, lib, ... }: {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      package = lib.mkIf pkgs.stdenv.isDarwin (lib.mkForce null);

      policies = import ./shared/_policies.nix;

      profiles."default" = {
        name = "default";
        id = 0;
        isDefault = true;

        extensions = import ./shared/_extensions.nix { inherit pkgs inputs; };
        settings = import ./shared/_settings.nix;
        search = import ./shared/_search.nix;
        bookmarks = import ./shared/_bookmarks.nix;
      };
    };
  };

  flake.modules.nixos.zen-browser = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      zen-browser
    ];

    custom.persist = {
      home.directories = [
        ".config/zen"
        ".cache/zen"
      ];
    };
  };

  flake.modules.darwin.zen-browser = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      zen-browser
    ];
  };
}
