{
  perSystem = { pkgs, ... }: let
    name = "obsidian-no-more-flickering-inline-math";
  in {
    packages.${name} = let
      owner = "RyotaUshio";
      repo = "obsidian-inline-math";
      version = "0.3.6";

      files = {
        "main.js"= pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
          hash = "sha256-JI5Lda8Ftw3ZREZTfZJQQOxxzaS8rg0LTimaWdsFx+o=";
        };
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-uvqxzVHNLlu1+6fQxyE90sr1YetJ2EEY5yJj05iL8zc=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
