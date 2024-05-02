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

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.defaultSession = "hyprland";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "*" ];
  };

  environment.systemPackages = with pkgs; [
    # menubar
    # waybar

    # screenshots
    grim
    slurp

    # widgets
    eww

    # audio control via cli
    pamixer

    # media play/pause via cli
    playerctl

    # wallpaper daemon
    # swww

    # notification daemon
    mako

    #screen sharing
    vesktop
  ];

}
