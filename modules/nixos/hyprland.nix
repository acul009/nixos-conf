{ lib, config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIX_OZONE_WL = "1";
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    # menubar
    waybar

    # wallpaper daemon
    swww

    # terminal
    kitty

    # app launcher
    rofi-wayland
  ];

}
