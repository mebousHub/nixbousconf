{ pkgs, ... }:
{
 
 programs.anki = {
 enable = true;
 language = "en_US";
 
 addons = with pkgs; [
                     ankiAddons.adjust-sound-volume
		     ankiAddons.anki-connect
		     ankiAddons.review-heatmap
		     ankiAddons.passfail2
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
