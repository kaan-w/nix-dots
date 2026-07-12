{
  perSystem = { pkgs, ... }: let
     name = "obsidian-color-folders-files";
  in {
    packages.${name} = let
      owner = "Mithadon";
      repo = "obsidian-color-folders-files";
      version = "1.4.1";

      files = {
        "main.js" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
          hash = "sha256-w9VT0lL9fcemmyRqrpcNpAEkvaupJnUWG5o7SnVecBs=";
        };
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-bYOj390ojvPxNitKtBKvcQi8ks5VkAWpV0JfgCFADqU=";
        };
        "styles.css" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/styles.css";
          hash = "sha256-+TXrtDDbPzBh2/knfDOaPHNa0bgLlncvrn5ySUjt1Eg=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
