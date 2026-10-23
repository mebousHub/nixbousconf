{ pkgs, ... }:
{

  environment.xfce.excludePackages = with pkgs; [
    mousepad
    parole
   # ristretto
   #xfce4-appfinder
   # xfce4-notifyd
   # xfce4-screenshooter
   # xfce4-session
   # xfce4-settings
    xfce4-taskmanager
    xfce4-terminal 
  ];

  services.xserver.desktopManager.xfce = {
  enable = true;
  };

}
