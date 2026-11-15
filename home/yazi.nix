{ ... }:

{

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    #flavors = { };
    #keymap = { };

    settings = {

    opener = {
      set_wallpaper_DP-1 = [ { run = "swaymsg output 'DP-1' bg %s1 fit"; for = "linux"; desc = "set wallpaper for DP-1"; orphan = true; } ];

        set_wallpaper_HDMI-A-1 = [ { run = "swaymsg output 'HDMI-A-1' bg %s1 fit"; for = "linux"; desc = "set wallpaper HDMI-A-1"; orphan = true; } ];

        open_image = [ { run = "swayimg %s"; for = "linux"; desc = "view with swayimg"; orphan = true; } ];

        open_video = [ { run = "mpv %s"; for = "linux"; desc = "view with mpv"; orphan = true; } ];
      };

      open.prepend_rules = [
      { mime = "image/*"; use = [ "open_image" "set_wallpaper_HDMI-A-1" "set_wallpaper_DP-1" ];}
      { mime = "video/*"; use = [ "open_video" ];}
      ];
    };
  };
}
