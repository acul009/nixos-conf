{lib, config, pkgs, ...}:

{

  # flatpak service
  services.flatpak.enable = true;
  environment.systemPackagesFlatpak = with pkgs; [
    flatpak
    gnome.gnome-software
  ];
}