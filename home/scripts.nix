{ pkgs, ... }:

{

  home.packages = with pkgs; [

    (writeShellScriptBin "mechaplayer" ''
       output=$(find ~/Music/ | rofi -dmenu)
       mpv "$output"
    '')

  ];

}
