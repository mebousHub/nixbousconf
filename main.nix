{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/amdgpudrivers.nix
      ./modules/games.nix
      ./modules/sunshine.nix
      ./modules/moonshine.nix
      ./modules/locale.nix
      ./modules/nixvim.nix
      ./modules/fcitx5.nix
      ./modules/packages.nix
      ./modules/plasma.nix
      ./modules/input.nix
#      ./modules/cinnamon.nix
      ./modules/flatpak.nix
      ./modules/xfce.nix
      ./modules/vr.nix
#      ./modules/duckstation.nix
    ];

    nixpkgs.config.allowUnfree = true;

  home-manager = {
  extraSpecialArgs = { inherit inputs; };
  users.mebous = {
     imports = [
     ./home/home.nix
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
	inputs.plasma-manager.homeModules.plasma-manager
     ];
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.tailscale.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.printing.enable = false;

  programs.sway.enable = true;
  programs.steam.protontricks.enable = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

 home-manager.backupFileExtension = "backup";

 hardware.graphics = {
   enable = true;
   extraPackages = with pkgs; [
   rocmPackages.clr.icd
   ];
 };


  environment.systemPackages = with pkgs; [
                                           acl
                                           alacritty
					   wayvr
					   ];
/*
  systemd.tmpfiles.rules = [
  # traverse-only on the parents (lowercase "a" = not recursive)
  "a+ /home/mebous              - - - - u:shineuser:--x,m::--x"
  "a+ /home/mebous/.local       - - - - u:shineuser:--x,m::--x"
  "a+ /home/mebous/.local/share - - - - u:shineuser:--x,m::--x"

  "A+ /home/mebous/ - - - - u:shineuser:rwX"
  "A+ /home/mebous/ - - - - d:u:shineuser:rwX"
  "A+ /home/mebous/.moonshine_stuff/ - - - - u:shineuser:rwX"
  "A+ /home/mebous/.moonshine_stuff/ - - - - d:u:shineuser:rwX"
];
*/
  networking = {
  hostName = "mebousnix";  
  networkmanager.enable = true;
  firewall.enable = false;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  };

  users = {
    
    users."mebous" = {
    isNormalUser = true;
    description = "mebous";
    extraGroups = [ "networkmanager" "wheel" ];
  };
};

   services.openssh.enable = true;

  system.stateVersion = "26.05";  
}
