{ pkgs, ...}:
{
    wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    configType = "lua";
    settings = {
      monitor = [
        { output = "HDMI-A-1"; mode = "1920x1080@75"; position = "1920x0"; scale = 1; }
        { output = "DP-1"; mode = "1920x1080@144"; position = "0x0"; scale = 1; }
	];
      };
  };
}
