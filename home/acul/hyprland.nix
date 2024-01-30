{ pkgs, lib, ... }:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = ''${startupScript}/bin/start'';

      # set mod key to windows key
      "$mod" = "SUPER";

      bindm = [
        # open app launcher
        "$mod, space, exec, rofi -show drun -show-icons"

        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      monitor = [
        "DP-2, 2560x1440, 1920x0, 1"
        "DP-2, 1920x1080, 0x0, 1"
        ",preferred,auto,1"
      ]
        };
    };
  }
