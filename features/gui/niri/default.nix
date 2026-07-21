{ inputs, config, ... }: {
  flake.modules.nixos.niri = { pkgs, ... }: {
    imports = [
      inputs.niri-nix.nixosModules.default
    ];

    nix.settings = {
      substituters = [
        "https://niri-nix.cachix.org"
      ];
      trusted-public-keys = [
        "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
      ];
    };

    programs.niri = {
      enable = true;
      withUWSM = true;
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      swaybg
      nautilus
    ];

    home-manager.sharedModules = [
      config.flake.modules.homeManager.niri
    ];
  };

  flake.modules.homeManager.niri = { wallpaper, ... }: {
    imports = [
      inputs.niri-nix.homeModules.default
      inputs.niri-nix.homeModules.stylix
      (import ./_settings.nix { inherit wallpaper; })
      ./_binds.nix
    ];

    wayland.windowManager.niri = {
      enable = true;
    };
  };
}
