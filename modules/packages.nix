{ pkgs, ... }:
{
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [

    icu
    libxkbcommon
    libglvnd
    fontconfig
    wayland
    mesa
    libx11
    libice
  ];

  environment.systemPackages = with pkgs; [
    ntfs3g
    kdePackages.plasma-bigscreen
    libnotify
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
}
