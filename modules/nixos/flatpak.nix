{lib, config, pkgs, ...}:

{

  # flatpak service
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    flatpak
    gnome.gnome-software
  ];
}