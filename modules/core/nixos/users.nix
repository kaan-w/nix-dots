{
  flake.modules.nixos.users = { pkgs, user, ... }: {
    users.users.${user} = {
      extraGroups = [ "networkmanager" "wheel" ];
      isNormalUser = true;
      shell = pkgs.zsh;
    };

    programs.zsh.enable = true;
  };
}
