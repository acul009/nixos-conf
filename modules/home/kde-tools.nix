{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.kde.tools = {
    enable = mkEnableOption "";
  };


  config = mkIf config.woelfchen.kde.tools.enable {
    home.packages = with pkgs.kdePackages; [
      kate
      dolphin
      dolphin-plugins
      kcalc
      ark
      breeze-icons
    ];
  };


}
