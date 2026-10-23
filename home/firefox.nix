{ pkgs, ... }:
{
  programs.firefox = {

  enable = true;
  
  profiles = {

  default = {

  extensions = {

          packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
	  yomitan
	  youtube-recommended-videos #unhook_addon
	  vimium
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
