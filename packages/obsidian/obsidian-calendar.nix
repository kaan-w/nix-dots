{
  perSystem = { pkgs, ... }: let
     name = "obsidian-calendar";
  in {
    packages.${name} = let
      owner = "liamcain";
      repo = "obsidian-calendar-plugin";
      version = "2.0.0-beta.2";

      files = {
        "main.js" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
          hash = "sha256-ZNHGxiCAMkZyS8kixcLgoXxAb/wj9rvPv7FMZDlY+7c=";
        };
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-MU/BeSmiJwsX6jklOO4tkzMHFIAOJEspdbbBn5uNxok=";
        };
        "styles.css" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/styles.css";
          hash = "sha256-SGtFAHbzQ5ueQIU2ZaP1HlCEyrpguILChbYPR2TCCFI=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
