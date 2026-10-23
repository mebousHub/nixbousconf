{ pkgs, lib, ... }:
{ 
  programs.retroarch = {
  enable = true;
 
  cores = {
  snes9x.enable = true;
  bsnes.enable = true;
  beetle-psx-hw.enable = true;
  pcsx-rearmed.enable = true;
  mupen64plus.enable = true;
  mame2016.enable = true;
  mame.enable = true;
    };
  };
}
