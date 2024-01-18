{ config, pkgs, ... }:

{
  qt.enable = true;

  # qt.platformTheme = "gtk";

  qt.style.name = "org.kde.breezedark.desktop";

  # qt.style.package = pkgs.adwaita-qt;

  # gtk.enable = true;
}
