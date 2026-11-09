{ config, pkgs, ... }:

{
  xfconf = {
    enable = true;

    settings = {

      xsettings = {
        "Net/ThemeName" = "Adwaita-dark";
        "Net/IconThemeName" = "Papirus-Dark";
        "Gtk/FontName" = "Noto Sans 10";
      };

      xfwm4 = {
        "general/theme" = "Default";
        "general/use_compositing" = true;
      };

      keyboards = {
        "/Default/KeyRepeat/Delay" = 250;
        "/Default/KeyRepeat" = true;
      };

    };
  };
}
