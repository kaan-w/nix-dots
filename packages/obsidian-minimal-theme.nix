{
  perSystem = { pkgs, ... }: let
    name = "obsidian-minimal-theme";
  in {
    packages.${name} = let
      owner = "kepano";
      repo = "obsidian-minimal";
      version = "8.1.7";

      files = {
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-fnHG00+iDOr+Ua/xIg7mLpp/yVSFkuAdpg02aUUifgc=";
        };
        "theme.css" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/theme.css";
          hash = "sha256-7kYQvCrskqSR47Zvw8boVN3N076Rq7n5qghw9q29+vg=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
