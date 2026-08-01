{ config, ... }: {
  flake.modules.nixos.shell_bundle = {
    imports = with config.flake.modules.nixos; [
      bat
      direnv
      fastfetch
      fzf
      git
      lazygit
      nh
      nix
      starship
      sudo
      zoxide
      zsh
    ];
  };

  flake.modules.darwin.shell_bundle = {
    imports = with config.flake.modules.darwin; [
      bat
      direnv
      fastfetch
      fzf
      git
      lazygit
      nh
      nix
      starship
      sudo
      zoxide
      zsh
    ];
  };
}
