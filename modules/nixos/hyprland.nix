{ inputs, lib, config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIX_OZONE_WL = "1";
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    # menubar
    waybar

    # audio control via cli
    pamixer

    # media play/pause via cli
    playerctl

    # wallpaper daemon
    swww

    # notification daemon
    dunst

    # terminal
    kitty

    # app launcher
    rofi-wayland
  ];

}
