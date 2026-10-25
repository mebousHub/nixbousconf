
{ ... }:

{
  programs.ssh = {
    enable = true;

    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.config/nixconf/home/ssh/mebousK";
        IdentitiesOnly = true;
        AddKeysToAgent = "yes";
      };
    };
  };
}

