{
  perSystem = { pkgs, ... }: let
     name = "obsidian-minimal-settings";
  in {
    packages.${name} = let
      owner = "kepano";
      repo = "obsidian-minimal-settings";
      version = "8.2.2";

      files = {
        "main.js" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
          hash = "sha256-iqk1CXf8oJj1bOpETrZylC4Q/K65sHrOsFo9U2iqdCs=";
        };
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-zAeyoIohKKyrn2ePL9waBJKzcL6SjW3fsd8a5LN2Zno=";
        };
        "styles.css" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/styles.css";
          hash = "sha256-UAhHYNqSelv1rBudO5YNxS4dCjv2kOVN+PTXb4ISYow=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
