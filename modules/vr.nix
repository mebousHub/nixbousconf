{ pkgs, ... }:
{
  services.wivrn = {
  enable = true;
  autoStart = true;
  highPriority = true;
  openFirewall = true;
  config = {
  enable = true;
  };
  steam = {
  enable = true;
  importOXRRuntimes = true;
    };
  };
}
