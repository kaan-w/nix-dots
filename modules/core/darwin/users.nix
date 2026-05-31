{
  flake.modules.darwin.users = { user, ... }: {
    users.users.${user} = {
      home = /Users/${user};
    };
  };
}
