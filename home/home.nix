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
    ./prismlauncher.nix
    ./retroarch.nix
    ./scripts.nix
    ./spotify.nix
    ./ssh/ssh.nix
    ./wiremix.nix
    ./mpd.nix
    ./plasma.nix
    ./quickshell.nix
    ./firefox.nix
    ./flameshot.nix
    ./yazi.nix
    #  ./hyprland/hyprland.nix
  ];
  services.polkit-gnome.enable = true;

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    android-tools
    bitwarden-desktop
    bibata-cursors
    bsnes-hd
    davinci-resolve
    eden
    emerald-legacy-launcher
    ffmpeg
    melonloader-installer
    mesen
    nicotine-plus
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
    mgba
    tiny-wii-backup-manager
    #    zelda64recomp
    #    (pkgs.callPackage ./package_moonshine.nix { })

    #  ventoy-full-qt

    #fonts
    martian-mono
    noto-fonts-cjk-sans
    monocraft
    profont
    azeret-mono
    hermit
    nerd-fonts.symbols-only
    nerd-fonts.noto
    nerd-fonts.hack



    discord
/*
    (discord.override {
      # withOpenASAR = true; # can do this here too
      withVencord = true;
    })
*/
  ];

  home.file = {
  "bralha" = {
  force = true;
  source = ./dotfiles/config.ini;
  target = ".config/mgba/config.ini";
  };

  "paperwall" = {
  force = true;
  source = ./paperwall; recursive = true;
  target = "paperwall/";
  };

  };

  home.shell.enableBashIntegration = true;

  programs.home-manager.enable = true;
}
