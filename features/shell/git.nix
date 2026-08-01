{ config, ... }: {
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;

      # https://wiki.nixos.org/wiki/Git#Using_your_public_SSH_key_as_a_signing_key
      signing = {
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = true;
      };

      settings = {
        user.name = "kaan-w";
        user.email = "105508453+kaan-w@users.noreply.github.com";

        init.defaultBranch = "main";
        gpg.format = "ssh";
      };
    };
  };

  flake.modules.nixos.git = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      git
    ];
  };

  flake.modules.darwin.git = {
    home-manager.sharedModules = with config.flake.modules.homeManager; [
      git
    ];
  };
}
