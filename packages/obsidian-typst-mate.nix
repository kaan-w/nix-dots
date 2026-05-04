{
  perSystem = { pkgs, ... }: let
    name = "obsidian-typst-mate";
  in {
    packages.${name} = let
      owner = "azyarashi";
      repo = "obsidian-typst-mate";
      version = "2.3.2";

      files = {
        "main.js" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
          hash = "sha256-B+Qg1W1K8Hit8dS7lqh1o6bj1g7uFstC92l02N63Z3c=";
        };
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-U2Hpt0lofqUrGiDv09qApwnWtOqUGAMcy8oAcD9+Kmo=";
        };
        "styles.css" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/styles.css";
          hash = "sha256-u0LPSANUDFhiEtwlwgyROD5dkY8eCodg4Z5fmPJtCuc=";
        };
        "typst-2.3.2.wasm" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/typst-2.3.2.wasm";
          hash = "sha256-MihFHj5kDS9amsQKOBbn84xWTHQUyElSU4rg5AJBUZ8=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
