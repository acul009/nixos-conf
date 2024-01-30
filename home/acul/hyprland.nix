{ pkgs, lib, config, ... }:

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
      general = with config.colorScheme.palette; {
        "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
        "col.inactive_border" = "rgba(${base00}ff)";
      };

      decoration = {
        inactive_opacity = 0.5;
      };

      # Autostart
      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.swww}/bin/swww init"
        "${pkgs.dunst}/bin/dunst"
      ];

      input = {
        kb_layout = "de";
        numlock_by_default = true;

        sensitivity = -0.2;
        # mouse acceleration
        accel_profile = "flat";
      };

      # keybinds
      bind = [
        # open app launcher
        "CTRL SHIFT, SPACE, exec,rofi -show drun -show-icons"
        "SUPER, SPACE, exec,rofi -show drun -show-icons"
        "SUPER, S, exec,rofi -show drun -show-icons"

        # close window
        "SUPER, X, killactive"

        "Super, mouse_up, movetoworkspace, e+0"

        # allow special layer
        "SUPER, C, movetoworkspace, special"
        "ALT, TAB, togglespecialworkspace"

        # debug
        "SUPER, F5, forcerendererreload"

      ];

      # mouse binds
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
        "SUPER ALT, mouse:272, resizewindow"
      ];

      # switches and media keys
      bindl = [
        ", XF86AudioRaiseVolume, exec, pamixer -i 10"
        ", XF86AudioLowerVolume, exec, pamixer -d 10"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      monitor = [
        "desc:Iiyama North America PLX2472HC 1153270400628, 1920x1080@60, 0x460, 1"

        "desc:Microstep MSI MAG321CQR KA3H028500018, 2560x1440@120, 1920x0, 1"

        # default values
        # ",preferred,auto,1"
      ];
    };
  };
}


