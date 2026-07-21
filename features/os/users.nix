{
  flake.modules.nixos.users = { user, ... }: {
    users.mutableUsers = false;

    users.users."root" = {
      initialPassword = "12345";
    };

    users.users.${user} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "12345";
    };
  };

  flake.modules.darwin.users = { user, ... }: {
    users.users.${user} = {
      home = /Users/${user};
    };

    system.primaryUser = user;
  };
}
