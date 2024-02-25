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

  services.xserver.displayManager.defaultSession = "hyprland";

  xdg.portal = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # menubar
    waybar

    # screenshots
    grim
    slurp

    # widgets
    eww-wayland

    # audio control via cli
    pamixer

    # media play/pause via cli
    playerctl

    # wallpaper daemon
    # swww

    # notification daemon
    mako

    # app launcher
    rofi-wayland

    #portal
    # xdg-desktop-portal-hyprland
  ];

}
