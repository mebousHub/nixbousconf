{ pkgs, ... }:
{
  programs.kitty = {
  enable = true;
  settings = {
  cursor_trail = "1";
  enable_audio_bell = "no";
  confirm_os_window_close = "0";
  background_opacity = "0.75";
    };
  };
}

