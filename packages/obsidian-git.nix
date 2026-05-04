{
  perSystem = { pkgs, ... }: let
    name = "obsidian-git";
  in {
    packages.${name} = pkgs.fetchzip {
      inherit name;
      url = "https://github.com/Vinzent03/obsidian-git/releases/download/2.38.2/obsidian-git-2.38.2.zip";
      hash = "sha256-M9DaGqa2ILEJ0GMJGSqry0VXDn5HYRkl1sfxpsUh9bQ=";
      stripRoot = true;
    };
  };
}
