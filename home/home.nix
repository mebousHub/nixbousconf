{ config, pkgs, lib, ... }:
{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mebous";
  home.homeDirectory = "/home/mebous";

  imports = [
  ./anki.nix
  ./git.nix
  ./sway.nix
  ./swaylock.nix
  ./mpv/mpv.nix
  ./rmpc.nix
  ./rofi.nix
  ./kitty.nix
  ./obsidian.nix
  ./obs.nix
  ./thunderbird.nix
  ./mullvad.nix
  ./prismlauncher.nix
  ./retroarch.nix
  ./spotify.nix
  ./wiremix.nix
  ./mpd.nix
  ./plasma.nix
  ./firefox.nix
            ];


/*
xdg.configFile."niri/config.kdl" = {
    enable = true;
    source = .config/niri/config.kdl;
  };
*/
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

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
    pcsx2
    peazip
    protonup-qt
    qbittorrent
    qpwgraph
    retroarch-assets
    scrcpy
    spotify
    swaybg
    vacuum-tube
    krita
    moonlight-qt
#    (pkgs.callPackage ./package_moonshine.nix { })

     
  #  ventoy-full-qt

            
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    (discord.override {
    # withOpenASAR = true; # can do this here too
    withVencord = true;
    })

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mebous/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


}

