{ config, pkgs, ... }:

{

  # uinput for mouse and keyboard support in sunshine
  # Enables the uinput kernel module and creates the uinput group
  hardware.uinput.enable = true;

  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true; # Required for Wayland/KMS capture; omit for Xorg
    openFirewall = true;

    settings = {

      address_family = "both";
      external_ip = "2804:7f0:b083:7df6:9c4d:7e0d:82b1:45d5";
      fec_percentage = "20";
      minimum_fps_target = "60";
      output_name = "0";
      sw_preset = "ultrafast";
      upnp = "enabled";
      mouse = "disabled";
      keyboard = "disabled";
    };

    applications = {
      apps = [
        {
          name = "Desktop";
          #   cmd = [ "setsid steam steam://open/bigpicture" ];
          image-path = "steam.png";
        }
      ];
    };
  };

}
