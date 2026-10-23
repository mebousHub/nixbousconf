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
  ];
   nixpkgs.config.permittedInsecurePackages = [
   "ventoy-1.1.17"
   "ventoy-qt5-1.1.17"
  ];
}

