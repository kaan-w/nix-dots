{
  flake.modules.nixos.localsend = {
    programs.localsend = {
      enable = true;
      openFirewall = true;
    };

    custom.persist = {
      home.directories = [
        ".local/share/org.localsend.localsend_app"
      ];
    };
  };

  flake.modules.darwin.localsend = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      localsend
    ];
  };
}
