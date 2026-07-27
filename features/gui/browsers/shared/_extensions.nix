{ pkgs, inputs, ...}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  force = true;
  packages = with inputs.nur.legacyPackages.${system}.repos.rycee.firefox-addons; [
    clearurls
    istilldontcareaboutcookies
    material-icons-for-github
    privacy-badger
    proton-pass
    return-youtube-dislikes
    sponsorblock
    terms-of-service-didnt-read
    ublock-origin
    unpaywall
    videospeed
    violentmonkey
    wayback-machine
    windscribe
  ];
}
