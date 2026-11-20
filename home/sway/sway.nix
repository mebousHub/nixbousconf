{ config, lib, ... }:
let
  modifier = "Mod4";
  terminal = "kitty";
  menu = "rofi -show combi -modes combi -combi-modes 'drun,run'";
  musicmenu = "mechaplayer";
  browser = "firefox";
  fmanager = "kitty yazi";
in
{
  wayland.windowManager.sway = {

    enable = true;
    xwayland = true;
    checkConfig = false;

    config = {
      inherit modifier terminal menu;
      keybindings =

        lib.mkOptionDefault {
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+r" = "exec ${menu}";
          "${modifier}+m" = "exec ${terminal} wiremix";
          "${modifier}+q" = "exec ${browser}";
          "${modifier}+e" = "exec ${fmanager}";
          "${modifier}+Shift+m" = "exec ${musicmenu}";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+Shift+z" = "exec swaylock";
          "${modifier}+Shift+s" = "exec flameshot gui";
          "${modifier}+Ctrl+s" = "exec flameshot gui";

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

        "type:tablet_tool" = {
          map_to_output = "HDMI-A-1";
        };
      };

      output = {

        DP-1 = {
          mode = "1920x1080@144Hz";
          position = "0 0";
          bg = "/home/mebous/paperwall/135.jpg fit";
        };
        HDMI-A-1 = {
          mode = "1920x1080@74.973Hz";
          position = "1920 0";
          bg = "/home/mebous/paperwall/133.jpg fit";
        };
      };

      defaultWorkspace = "workspace number 1";

      workspaceOutputAssign = [
        {
          workspace = "1";
          output = "DP-1";
        }
        {
          workspace = "2";
          output = "DP-1";
        }
        {
          workspace = "3";
          output = "DP-1";
        }
        {
          workspace = "4";
          output = "DP-1";
        }
        {
          workspace = "5";
          output = "DP-1";
        }
        {
          workspace = "6";
          output = "HDMI-A-1";
        }
        {
          workspace = "7";
          output = "HDMI-A-1";
        }
        {
          workspace = "8";
          output = "HDMI-A-1";
        }
        {
          workspace = "9";
          output = "HDMI-A-1";
        }
        {
          workspace = "10";
          output = "HDMI-A-1";
        }
      ];

      window = {
        titlebar = false;
        border = 2;
      };
      gaps = {
        inner = 5;
        outer = 15;
        top = 0;
      };

      colors = {

      focused = {
        border =      "#d3cbd1";
        background =  "#d3cbd1";
        text =        "#5c0d2a";
	indicator =   "#d3cbd1";
	childBorder = "#d3cbd1";
      };

      focusedInactive = {
        border =      "#101110";
        background =  "#101110";
        text =        "#101110";
	indicator =   "#101110";
	childBorder = "#101110";
      };

      unfocused = {
        border =      "#101110";
        background =  "#101110";
        text =        "#101110";
	indicator =   "#101110";
	childBorder = "#101110";
      };
    };

      bars = [ 
      
        { position = "top"; }
        ];
      

    };
  };
}
