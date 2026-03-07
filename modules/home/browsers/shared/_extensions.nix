{ pkgs, inputs, ...}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  force = true;
  packages = with inputs.nur.legacyPackages.${system}.repos.rycee.firefox-addons; [
    ublock-origin
    material-icons-for-github
    terms-of-service-didnt-read
    wayback-machine
    clearurls
    return-youtube-dislikes
    sponsorblock
    privacy-badger
    istilldontcareaboutcookies
    unpaywall
    violentmonkey
    proton-pass
    windscribe
    videospeed
  ];
}
