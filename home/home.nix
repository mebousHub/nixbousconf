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
    ./firefox.nix
    ./flameshot.nix
    ./git.nix
    ./mpv/mpv.nix
    ./mpd.nix
    ./rmpc.nix
    ./rofi.nix
    ./lutris.nix
    ./kitty.nix
    ./obs.nix
    ./thunderbird.nix
    ./teste.nix
    ./prismlauncher.nix
    ./retroarch.nix
    ./scripts.nix
    ./spotify.nix
    ./ssh/ssh.nix
    ./wiremix.nix
    ./plasma.nix
    ./quickshell.nix
    ./waybar.nix
    ./yazi.nix
    ./ytdlp.nix
    #  ./hyprland/hyprland.nix
  ];
  services.polkit-gnome.enable = true;

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [

    #home system tools
    android-tools
    bibata-cursors
    bitwarden-desktop
    deno
    ffmpeg
    peazip
    qpwgraph
    scrcpy
    spotdl

    #media
    mpc
    spotify
    vacuum-tube

    #retro games and emulation
    bsnes-hd
    eden
    emerald-legacy-launcher
    mesen
    mgba
    retroarch-assets
    tiny-wii-backup-manager
#    zelda64recomp

    #desktop applications
    basalt
    davinci-resolve
    discord
    krita
    logseq
    melonloader-installer #mod installer for smt3 hd edition
    moonlight-qt
    nicotine-plus
    parabolic
    parsec-bin
    protonup-qt
    qbittorrent

    #gtk themes
    chicago95 # windows 95 theme

    #fonts
    azeret-mono
    hermit
    martian-mono
    monocraft
    nerd-fonts.hack
    nerd-fonts.noto
    nerd-fonts.symbols-only
    noto-fonts-cjk-sans
    profont

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
