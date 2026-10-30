{ inputs, ... }:
{
  programs.sway.enable = true;

  home-manager = {
  extraSpecialArgs = { inherit inputs; };
  users.mebous = {
     imports = [
     ./home/sway/sway.nix
     ./home/sway/swaylock.nix
     ];
    };
  };

}

