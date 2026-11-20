{ config, pkgs, inputs, ... }:

{
  home.file.".local/share/themes/Windows-7".source =
    inputs.windows7-gtk;

  gtk = {
    enable = true;

    theme = {
      name = "Windows-7";
    };
  };
}
