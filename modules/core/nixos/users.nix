{
  flake.modules.nixos.users = { pkgs, user, ... }: {
    users.mutableUsers = false;

    users.users."root" = {
      initialPassword = "12345";
    };

    users.users.${user} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "12345";
      shell = pkgs.zsh;
    };

    programs.zsh.enable = true;
  };
}
