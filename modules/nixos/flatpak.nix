{lib, config, pkgs, ...}:

{
  xdg.portal.enable = true;

  # flatpak service
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    flatpak
    gnome.gnome-software
  ];
}