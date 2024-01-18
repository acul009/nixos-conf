{lib, config, pkgs, ...}:

{

  environment.systemPackages = with pkgs; [
    teamviewer
  ];

  # teamviewer service
  services.teamviewer.enable = true;
}