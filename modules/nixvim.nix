{ pkgs, ... }:
{

   programs.nixvim.version.enableNixpkgsReleaseCheck = false;
   programs.nixvim = {
     enable = true;
     viAlias = true;
     vimAlias = true;
     colorschemes.base16.enable = true;
     colorscheme = "base16-ayu-mirage";
     defaultEditor = true;
       opts = {
       number = true;
       breakindent = false;
       preserveindent = false;
       };

       plugins.lsp = {

       enable = true;

       servers = {
       
       clangd = {
         enable = true;
         package = pkgs.clang-tools;
       };

      nil_ls = {
        enable = true;
      };

       };
     };
   };
}
