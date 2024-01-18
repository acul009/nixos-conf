{ config, pkgs, ...}:

{
  qt.enable = true;

  qt.platformTheme = "gtk";

  qt.style.name = "adawaita-dark";

  qt.style.package = pkgs.adwaita-qt;

  # gtk.enable = true;
}