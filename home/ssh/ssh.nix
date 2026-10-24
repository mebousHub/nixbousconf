
{ ... }:

{
  programs.ssh = {
    enable = true;

    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "./mebousK";
        IdentitiesOnly = true;
        AddKeysToAgent = "yes";
      };
    };
  };
}

