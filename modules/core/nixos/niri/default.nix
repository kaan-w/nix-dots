{ inputs, ... }: {
  flake.modules.nixos.niri = { pkgs, user, wallpaper, ... }: {
    imports = [
      inputs.niri-nix.nixosModules.default
    ];

    programs.niri = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      swaybg
    ];

    home-manager.users.${user} = {
      imports = [
        inputs.niri-nix.homeModules.default
        (import ./_settings.nix { inherit wallpaper; })
        ./_binds.nix
      ];

      wayland.windowManager.niri = {
        enable = true;
      };
    };
  };
}
