{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = true;

    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "/etc/nixos/home/ssh/mebousK";
        IdentitiesOnly = true;
        AddKeysToAgent = "yes";
      };
    };
  };
}
