{ lib, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    nmap
  ];

  # teamviewer service
  services.teamviewer.enable = true;
}
