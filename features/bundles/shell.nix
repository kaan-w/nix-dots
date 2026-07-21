{ config, ... }: {
  flake.modules.homeManager.shell_bundle = {
    imports = with config.flake.modules.homeManager; [
      bat
      direnv
      fastfetch
      git
      lazygit
      nh
      starship
      zoxide
    ];
  };

  flake.modules.nixos.shell_bundle = {
    imports = with config.flake.modules.nixos; [
      nix
      sudo
      zsh
    ];

    home-manager.sharedModules = with config.flake.modules.homeManager; [
      shell_bundle
    ];
  };

  flake.modules.darwin.shell_bundle = {
    imports = with config.flake.modules.darwin; [
      nix
      sudo
      zsh
    ];

    home-manager.sharedModules = with config.flake.modules.homeManager; [
      shell_bundle
    ];
  };
}
