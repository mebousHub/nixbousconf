{ ... }:

{
  
  users = {

    users."mebous" = {
      isNormalUser = true;
      description = "mebous";
      extraGroups = [
        "networkmanager"
        "wheel"
	"input"
      ];
    };
  };
  
}
