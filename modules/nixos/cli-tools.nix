{ lib, config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    nmap
    cope
  ];

  # teamviewer service
  services.teamviewer.enable = true;
}
