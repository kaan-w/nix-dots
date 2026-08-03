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
        search = import ./shared/_search.nix;
        bookmarks = import ./shared/_bookmarks.nix;

        settings = (import ./shared/_settings.nix) // {
          # Don't show the Zen welcome screen
          "zen.welcome-screen.seen" = true;

          # Enable tab audio visualizer
          "zen.mods.AudioIndicatorEnhanced.audioWave.enabled" = true;
        };

        mods = [
          "2317fd93-c3ed-4f37-b55a-304c1816819e" # Audio Indicator Enhanced
          "cb5efa80-f1e1-43ce-8c0b-fece8462d225" # Container Halo
          "181e41d4-dfd3-410d-9a73-561381a2f77d" # Extensions List
          "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
          "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
          "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
          "4c2bec61-7f6c-4e5c-bdc6-c9ad1aba1827" # Vertical Split Tab Groups
        ];
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
