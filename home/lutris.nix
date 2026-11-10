{ pkgs, ... }:
{

  home.packages = with pkgs; [
    pcsx2
    dolphin-emu
  ];

  programs.lutris = {
    enable = true;
 
     winePackages = [ pkgs.wineWow64Packages.waylandFull
     		     pkgs.winetricks
		     pkgs.wineWow64Packages.stagingFull
		     ];
		     
		       defaultWinePackage = pkgs.wineWow64Packages.stagingFull;


    runners = {

      pcsx2 = {
        package = pkgs.pcsx2;
        settings.runner = {
          full_boot = true;
          fullscreen = true;
          nogui = true;
        };
        settings.system = {
          bios_path = "/home/mebous/emugames/ps2/bios";
          game_path = "/home/mebous/emugames/ps2";
        };
      };

      dolphin = {
        package = pkgs.dolphin-emu;
        settings.system = {
          game_path = "/home/mebous/emugames/wii_gc";
        };
      };
    };
  };
}
