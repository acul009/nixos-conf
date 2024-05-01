{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.hyprland =
    {
      enable = mkEnableOption "";
    };

  config = mkIf config.woelfchen.hyprland.enable {

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIX_OZONE_WL = "1";
    };

    services.displayManager.sddm.enable = true;
    services.displayManager.defaultSession = "hyprland";

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = [ "*" ];
    };
  };
}
