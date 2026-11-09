{ ... }:

{

  services.mullvad-vpn = {
  enable = true;
  enableEarlyBootBlocking = true;
  gui.enable = false;
  };
}
