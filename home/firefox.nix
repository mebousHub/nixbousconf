{ pkgs, ... }:
{
  programs.firefox = {
  enable = true;

  policies = {

  DefaultDownloadDirectory = "\${home}/Downloads";
  DisableTelemetry = true;

  WebsiteFilter = {
  Block = [ "https://www.instagram.com/*" "https://x.com/*"];
  };

    EnableTrackingProtection = {
    Value = true;
    Cryptomining = true;
    Fingerprinting = true;
    SuspectedFingerprinting = true;
    EmailTracking = true;
    #Exceptions = "";
  };

  EncryptedMediaExtensions = { Enabled = true;}; #enables widevine support

  ExtensionSettings = {

    "uBlock0@raymondhill.net" = {
       private_browsing = true;
       installation_mode = "force_installed";
       install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
       };
    "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = { #enables vimium
       private_browsing = true;
       install_url = "https://addons.mozilla.org/firefox/downloads/latest/{d7742d87-e61d-4b78-b8a1-b469842139fa}/latest.xpi";
       };
     };
};

  
  profiles = {

  default = {

  extensions = {

          packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
	  vimium
          bitwarden
	  yomitan
	  youtube-recommended-videos #unhook_addon
         ];
       };

  search = {
  
  force = true;
  default = "Brave";

  engines = {
  nix-packages = {
              name = "Nix Packages";
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
		 };

    "Brave" = {
      urls = [
        {
          template = "https://search.brave.com/search";
          params = [
            { name = "q"; value = "{searchTerms}"; }
          ];
        }
      ];
      definedAliases = [ "@brave" ];
           };
         };
       };
     };
   };
 };
}
