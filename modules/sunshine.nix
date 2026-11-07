{ config, pkgs, ... }:

{

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true; # Required for Wayland/KMS capture; omit for Xorg
    openFirewall = true;

    settings = {

      address_family = "both";
#      bind_address = "100.103.224.26";
#      audio_sink = "";
#      virtual_sink = "";
      port = 50000;
      ping_timeout = "60000";
      fec_percentage = "20";
      minimum_fps_target = "30";
      output_name = "1";
      sunshine_name = "mebousCouch";
      sw_preset = "ultrafast";
      upnp = "disabled";
      mouse = "disabled";
      keyboard = "disabled";
      gamepad = "auto";
      motion_as_ds4 = "enabled";
      back_button_timeout = "3000";
      key_repeat_delay = "200";
      key_repeat_frequency = "100";
    };

    applications = {
      apps = [
        {
          name = "Desktop";
          #   cmd = [ "setsid steam steam://open/bigpicture" ];
        }
      ];
    };
  };

}
