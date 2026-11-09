{ pkgs, ... }:
{

  programs.mpv = {
    enable = true;

    config = {
      volume = 60;
      input-ipc-server = "/tmp/mpv-socket"; #mpv subtitle miner config
    };

    scriptOpts = {

      subtitleminer = {
        ports = "61777,61778,61779,61780,61781";
        auto_start = "yes";
      };
    };
  };

  home.file = {

    "scriptlua" = { # mpv subtitle miner script
    force = true;
    source = ./scripts/mpv-subtitleminer.lua;
    target = ".config/mpv/scripts/mpv-subtitleminer.lua";
    };
  
    "mpvSubMinerBin" = {
    force = true;
    source = ./mpv-subtitleminer;
    target = ".config/mpv/mpv-subtitleminer";
    };
  
    "mpvSubMinerLauncher" = {
    force = true;
    source = ./index.html;
    target = "mpvSubMiner.html";
    };
  };
   
}  
   
   
  
   
   
   
   
   
  
   
   
   
   
   
