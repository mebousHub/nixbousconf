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
    ffmpeg
    peazip
    qpwgraph
    scrcpy
    spotdl
    deno
#    ventoy-full-qt

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
    davinci-resolve
    discord
    krita
    melonloader-installer #mod installer for smt3 hd edition
    moonlight-qt
    nicotine-plus
    parabolic
    parsec-bin
    protonup-qt
    qbittorrent

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
