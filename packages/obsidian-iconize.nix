{
  perSystem = { pkgs, ... }: let
    name = "obsidian-iconize";
  in {
    packages.${name} = let
      owner = "FlorianWoelki";
      repo = "obsidian-iconize";
      version = "2.14.7";

      files = {
        "main.js" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
          hash = "sha256-raCwCXBlVsmBAflTpqh/XK/TABCF31k9O+KO7uohggE=";
        };
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-9SShjWnpkKJEFzo1lWgcOaILy8ncGLWa9R5FZg/vXKI=";
        };
        "styles.css" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/styles.css";
          hash = "sha256-Vv/rg0n0r5fauKFPytywAZ07N7EW16NKoh6VjphFWok=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
