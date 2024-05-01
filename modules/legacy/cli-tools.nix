{ lib, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    nmap
    dig
  ];

  # teamviewer service
  services.teamviewer.enable = true;
}
