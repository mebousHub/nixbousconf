{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    #system modules
    ./hardware-configuration.nix
    ./modules/fcitx5.nix
    ./modules/input.nix
    ./modules/locale.nix
    ./modules/users.nix

    #gaming modules
    ./modules/amdgpudrivers.nix
    ./modules/games.nix
    ./modules/moonshine.nix
    #./modules/sunshine.nix
    ./modules/vr.nix
    #./modules/duckstation.nix

    #desktop modules
    #./modules/cinnamon.nix
    ./modules/plasma.nix
    ./modules/sway.nix
    ./modules/xfce.nix

    #package modules
    ./modules/flatpak.nix
    ./modules/packages.nix

    #misc modules
    ./modules/jellyfin.nix
    ./modules/nixvim.nix

  ];

  nix.settings = { experimental-features = [ "nix-command" "flakes" ]; };

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

  boot = {

  supportedFilesystems = [ "ntfs" ];
  kernelPackages = pkgs.linuxPackages_latest;

  loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    };

  };

  services.tailscale.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.printing.enable = false;
  security.polkit.enable = true;
  services.openssh.enable = true;
#  systemd.services.moonshine.restartIfChanged = false;

  programs.steam.protontricks.enable = true;
#  programs.hyprland.enable = true;

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
    nixfmt

  ];

  networking = {
    hostName = "mebousnix";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  system.stateVersion = "26.05";
}
