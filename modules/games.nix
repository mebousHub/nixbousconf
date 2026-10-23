{ pkgs, ... }:
{

  hardware.steam-hardware.enable = true;

  environment.systemPackages = [ pkgs.gamescope ];

  programs = {
  gamescope.enable = true;
    steam = {

      enable = true;
      extest.enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];

    };
    gamemode = { enable = true;};
  };
}
