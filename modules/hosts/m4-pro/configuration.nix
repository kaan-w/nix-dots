{ config, inputs, ... }: {
  flake.modules.darwin.m4-pro = { user, ... }: {
    imports = with config.flake.modules.darwin; [
      config.flake.modules.generic.nix
      config.flake.modules.generic.networking
      macos
    ];

    # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
    homebrew = {
      enable = true;
      brews = [ "cava" ];
      casks = [
        "raycast"
        "zen"
        "proton-pass"
        "ente-auth"
        "excalidrawz"
        "aldente"
        "cloudflare-warp"
      ];
      masApps = {
        "TestFlight" = 899247664;
        "Xcode" = 497799835;
        "Whatsapp Messenger" = 310633997;
      };

      # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.onActivation.cleanup
      onActivation.cleanup = "zap";
    };

    nix-homebrew.taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    users.users.${user} = {
      home = /Users/${user};
    };

    nixpkgs.hostPlatform = "aarch64-darwin";

    # Set Git commit hash for darwin-version
    system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;
  };
}
