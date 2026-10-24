{ pkgs, ... }:
{
 
 programs.anki = {
 enable = true;
 language = "en_US";
 
 addons = with pkgs; [
		     ankiAddons.review-heatmap
		     ankiAddons.passfail2
                     ankiAddons.adjust-sound-volume
		     (ankiAddons.anki-connect.withConfig {
		     config = {
                         apiKey = null;
                         apiLogPath = null;
                         ignoreOriginList = [];
                         webBindAddress = "127.0.0.1";
                         webBindPort = 8765;
                         webCorsOriginList = ["http://localhost" "null"];
			 };
		       })
		     ];
 profiles = {
 "User 1" = {
     default = true;
     sync = {
     autoSync = true;
     syncMedia = true;
     autoSyncMediaMinutes = 30;
     username = "audiodozapkk@gmail.com";
     };
    };
  };

   style = "native";
   theme = "dark";

};

}
