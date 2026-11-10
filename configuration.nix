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
    ./modules/mullvad.nix
    ./modules/solaar.nix

    #gaming modules
    ./modules/amdgpudrivers.nix
    ./modules/games.nix
    ./modules/moonshine.nix
    ./modules/sunshine.nix
    ./modules/vr.nix
    #./modules/duckstation.nix

    #desktop modules
    #./modules/cinnamon.nix
    ./modules/plasma.nix
    ./modules/sway.nix
#    ./modules/xfce.nix

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

    # uinput for mouse and keyboard support in sunshine
    # Enables the uinput kernel module and creates the uinput group
  hardware.uinput.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  environment.systemPackages = with pkgs; [
    acl
    alacritty
    wayvr
    nixfmt

    winetricks
    wine
    wine-wayland
    wine-staging
    winePackages.full
    wine64Packages.full
    wineWow64Packages.full
  ];

  networking = {
    hostName = "mebousnix";
    networkmanager.enable = true;

    firewall = {
    enable = false;

    allowedTCPPorts = [
      49995 # HTTPS sunshine
      50000 # HTTP sunshine
      50001 # Web UI sunshine
      50021 # RTSP sunshine
    ];

    allowedUDPPorts = [
      50009 # Video sunshine
      50010 # Control sunshine
      50011 # Audio sunshine
      50013 # Microphone sunshine
       ];
   };
 };

  system.stateVersion = "26.05";
}
