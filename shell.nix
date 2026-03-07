{ pkgs ? import <nixpkgs> {} }: pkgs.mkShellNoCC {
  buildInputs = with pkgs; [
    nixd
    nil
  ];

  shellHook = ''
    git status --short
  '';
}
