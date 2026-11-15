{ pkgs, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/mebous/Music";
    playlistDirectory = "/home/mebous/Music/playlist";

    extraConfig = ''
      auto_update "yes"
     
      audio_output {
          type            "pipewire"
          name            "HyperX Cloud III"
          mixer_type      "software"
      }
      '';

  };

  services.mpd-mpris = {
    enable = true;
  };
}
