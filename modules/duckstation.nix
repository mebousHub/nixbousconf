
{ config, lib, pkgs, inputs, ... }:

let
  duckstation = pkgs.appimageTools.wrapType2 {
    pname = "duckstation";
    version = "latest";

    src = pkgs.fetchurl {
      url = "https://github.com/stenzek/duckstation/releases/download/latest/DuckStation-x64.AppImage";
      hash = "sha256-xebwRfaiQggvyvqfAtVq2JXiM7lCcoeI0jKtDAx2XCQ=";
    };

    extraPkgs = pkgs: with pkgs; [
      libGL
      vulkan-loader
      SDL2
      libxkbcommon
    ];

    meta = {
      description = "DuckStation PlayStation emulator";
      homepage = "https://github.com/stenzek/duckstation";
      platforms = [ "x86_64-linux" ];
      mainProgram = "duckstation";
    };
  };
in
{
  environment.systemPackages = [
    duckstation
  ];
}

