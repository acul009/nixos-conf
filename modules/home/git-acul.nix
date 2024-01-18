
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "acul009";
    userEmail = "acul009@gmail.com";
    extraConfig = {
      credential.helper = "cache --timeout=36000"
    }
  }
}