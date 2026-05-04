{
  perSystem = { pkgs, ... }: let
    name = "obsidian-periodic-notes";
  in {
    packages.${name} = pkgs.fetchzip {
      inherit name;
      url = "https://github.com/liamcain/obsidian-periodic-notes/releases/download/0.0.17/periodic-notes-0.0.17.zip";
      hash = "sha256-OjeYVOSKZACdHZ8S6qa4eDq7U+BL7/00iEZnkYbJHoM=";
      stripRoot = true;
    };
  };
}
