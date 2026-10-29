{ pkgs, ... }:
{
  programs.lutris = {
  enable = true;
 
  runners = {
  pcsx2 = {
  package = pkgs.pcsx2;
  settings.runner = {
  full_boot = true;
  fullscreen = true;
  nogui = true;
  };
  settings.system = {
  bios_path = "/home/mebous/emugames/ps2/bios";
  game_path = "/home/mebous/emugames/ps2";
  };
      };
    };
  };
}


