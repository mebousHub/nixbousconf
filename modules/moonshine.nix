{ inputs, ... }:
{

 imports = [ inputs.moonshine.nixosModules.default ];

    users = {

  groups.shineuser = {};

  users = {

  "shineuser" = {
  isNormalUser = true;
  createHome = true;
  home = "/home/moonshine";
  description = "moonshine user account";
  group = "shineuser";
  homeMode = "2770";
  extraGroups = [ "input" "moonshine" "uinput" ];
    };
  };
};

  services.moonshine = {
    enable = true;

    # The user whose applications you want to stream.
    user = "shineuser";
    # Only needed when the user's uid is not declared in your
    # configuration. Check with `id -u alice`.
    uid = 1001;

    # Opens the GameStream ports. Only do this on a LAN or VPN-facing
    # firewall. See Security in the main README.
    openFirewall = true;

    # Everything from the Configuration section of the main README goes
    # here, written as nix instead of TOML.
    settings = {
      application = [
        {
          title = "Steam";
          command = [
            "/run/current-system/sw/bin/steam"
            "steam://open/bigpicture"
          ];
        }
      ];

      application_scanner = [
        {
          type = "steam";
          library = "/home/moonshine/.local/share/steam";
          command = [
            "/run/current-system/sw/bin/steam"
            "-bigpicture"
            "steam://rungameid/{game_id}"
          ];
        }
      ];
    };
  };
}
