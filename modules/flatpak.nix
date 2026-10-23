{ pkgs, ... }:
{

services.flatpak = {
    enable = true;

      packages = [

  rec {
    appId = "ai.storyteller.filmcraft";
    sha256 = "sha256-v4XgkrtQXttdrO4ynqTIRasMYcKYisIBDpkry0UxVEc=";
    bundle = "${pkgs.fetchurl {
      url = "https://github.com/storytold/filmcraft/releases/download/v0.9.0/filmcraft-0.9.0-linux-x86_64.flatpak";
      inherit sha256;
    }}";
  }

  "org.vinegarhq.Sober"
  "com.spotify.Client"
  "com.discordapp.Discord"

  ];
};

}
