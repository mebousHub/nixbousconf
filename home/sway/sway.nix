{ config, lib, ... }:
      let
        modifier = "Mod4";
        terminal = "kitty";
        menu = " rofi -show combi -modes combi -combi-modes 'drun,run'";
	browser = "firefox";
	fmanager = "dolphin";
      in
{
 wayland.windowManager.sway = {

 enable = true;
 xwayland = true;
 checkConfig = false;

 config = {
     inherit modifier terminal menu;
 keybindings = 
	/*
        modifier = config.wayland.windowManager.sway.config.modifier;
        terminal = config.wayland.windowManager.sway.config.terminal;
        menu = config.wayland.windowManager.sway.config.menu;
	*/
      lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+r" = "exec ${menu}";
        "${modifier}+m" = "exec ${terminal} wiremix";
        "${modifier}+q" = "exec ${browser}";
        "${modifier}+e" = "exec ${fmanager}";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
};

      input = {

      "type:pointer" = {
      accel_profile = "flat";
      pointer_accel = "0";
      };
      "type:keyboard" = {
      repeat_delay = "200";
      repeat_rate = "100";
      xkb_layout = "us";
      xkb_variant = "intl";
      };
};

      output = {

      DP-1 = {
      mode = "1920x1080@144Hz";
      position = "0 0";
      bg = "/home/mebous/.config/nixconf/paperwall/103.jpg fit";
#      bg = "/home/mebous/paperwall/56.png fill";
      };
      HDMI-A-1 = {
      mode = "1920x1080@74.973Hz";
      position = "1920 0";
      bg = "/home/mebous/.config/nixconf/paperwall/134.jpg fit";
      };
};

      defaultWorkspace = "workspace number 1";

      workspaceOutputAssign = [
      { workspace = "1"; output = "DP-1"; }
      { workspace = "2"; output = "DP-1"; }
      { workspace = "3"; output = "DP-1"; }
      { workspace = "4"; output = "DP-1"; }
      { workspace = "5"; output = "DP-1"; }
      { workspace = "6"; output = "HDMI-A-1"; }
      { workspace = "7"; output = "HDMI-A-1"; }
      { workspace = "8"; output = "HDMI-A-1"; }
      { workspace = "9"; output = "HDMI-A-1"; }
      { workspace = "10"; output = "HDMI-A-1"; }
      ];

      window = {
      titlebar = false;
      border = 2;
};
      gaps = {
      outer = 15;
      };


    };
  }; 
}
