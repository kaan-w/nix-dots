{
  perSystem = { pkgs, ... }: let
    name = "obsidian-tag-wrangler";
  in {
    packages.${name} = pkgs.fetchzip {
      inherit name;
      url = "https://github.com/pjeby/tag-wrangler/releases/download/0.6.4/tag-wrangler.zip";
      hash = "sha256-s85VVAqn6Ob0iz2VsbuRAqJGv4uYV/VNMzmeX1jdsA4=";
      stripRoot = true;
    };
  };
}
