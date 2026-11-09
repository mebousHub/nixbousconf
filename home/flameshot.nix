{ ... }:

{
  
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        allowMultipleGuiInstances = true;
        contrastOpacity= "188";
        filenamePattern= "%m_%a(%d)_%Y";
        showStartupLaunchMessage = false;
        startupLaunch = true;
        useJpgForClipboard = true;
      };
    };
  };
}
