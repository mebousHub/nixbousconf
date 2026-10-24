{ pkgs, ... }:
{

programs.mpv = {
enable = true;

config = {
volume=60;
input-ipc-server="/tmp/mpv-socket";
    };

scriptOpts = {
  subtitleminer = {
  ports = "61777,61778,61779,61780,61781";
  auto_start = "yes";
      };
    };
  };
}
