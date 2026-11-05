{
  config,
  pkgs,
  lib,
  ...
}:
{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mebous";
  home.homeDirectory = "/home/mebous";

  imports = [
    ./anki.nix
    ./git.nix
    ./mpv/mpv.nix
    ./rmpc.nix
    ./rofi.nix
    ./lutris.nix
    ./kitty.nix
    ./obsidian.nix
    ./obs.nix
    ./thunderbird.nix
    ./mullvad.nix
    ./prismlauncher.nix
    ./retroarch.nix
    ./spotify.nix
    ./ssh/ssh.nix
    ./wiremix.nix
    ./mpd.nix
    ./plasma.nix
    ./quickshell.nix
    ./firefox.nix
    #  ./hyprland/hyprland.nix
  ];
  services.polkit-gnome.enable = true;

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    android-tools
    bitwarden-desktop
    bsnes-hd
    davinci-resolve
    eden
    emerald-legacy-launcher
    ffmpeg
    melonloader-installer
    mullvad
    mesen
    parabolic
    parsec-bin
    peazip
    protonup-qt
    qbittorrent
    qpwgraph
    retroarch-assets
    scrcpy
    spotify
    vacuum-tube
    krita
    moonlight-qt
    #    zelda64recomp
    #    (pkgs.callPackage ./package_moonshine.nix { })

    #  ventoy-full-qt

    #fonts
    martian-mono
    noto-fonts-cjk-sans
    monocraft

    (discord.override {
      # withOpenASAR = true; # can do this here too
      withVencord = true;
    })

  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
