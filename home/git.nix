{ ... }:
{
  programs.git = {
  enable = true;
  
  settings = {
  user = {
  name = "mebous";
  email = "mebousproton@protonmail.com";
  };
  init.defaultBranch = "main";
  safe.directory = "/etc/nixos";
  };
  /*
  includes = [{
  contents = {
  user = {
  email
*/
  };
}
