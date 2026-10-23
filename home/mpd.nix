{ pkgs, ... }:
{
  services.mpd = {
  enable = true;
  musicDirectory = "/home/mebous/Music";
  };

  services.mpd-mpris = {
  enable = true;
  };
}
