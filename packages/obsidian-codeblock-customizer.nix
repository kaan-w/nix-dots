{
  perSystem = { pkgs, ... }: let
    name = "obsidian-codeblock-customizer";
  in {
    packages.${name} = let
      owner = "mugiwara85";
      repo = "CodeblockCustomizer";
      version = "1.4.7";

      files = {
        "main.js" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
          hash = "sha256-8KQ3obQ9Egh0kk8qzXyzWzE63Hp9cQ/w8YmTDJSOfBs=";
        };
        "manifest.json" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
          hash = "sha256-Y47hx/I9qkqQD5ipgrcp/aBLfi7+VXdcV19IrHDKlSc=";
        };
        "styles.css" = pkgs.fetchurl {
          url = "https://github.com/${owner}/${repo}/releases/download/${version}/styles.css";
          hash = "sha256-OUPDKwrHwQr0dubDZGHfWanel4jQV8bxSacsIWBhszk=";
        };
      };
    in pkgs.linkFarm name files;
  };
}
