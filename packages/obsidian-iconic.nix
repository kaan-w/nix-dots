{
  perSystem = { pkgs, ... }: let
    name = "obsidian-iconic";
  in {
    packages.${name} = pkgs.fetchzip {
      inherit name;
      url = "https://github.com/gfxholo/iconic/releases/download/1.1.9/iconic-1.1.9.zip";
      hash = "sha256-x+0QNEE5sVUZ8M+/Hw1suCTQe0q2VUN416Xr6lqwtoU=";
      stripRoot = true;
    };
  };
}
