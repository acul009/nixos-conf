{ pkgs, lib, config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      general = with config.colorScheme.palette; {
        "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
        "col.inactive_border" = "rgba(${base00}ff)";
      };

      decoration = {
        inactive_opacity = 0.9;
      };

      # Autostart
      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.swww}/bin/swww init"
      ];

      input = {
        kb_layout = "de";
        numlock_by_default = true;

        sensitivity = -0.2;
        # mouse acceleration
        accel_profile = "flat";
      };

      # keybinds
      bind = lib.lists.flatten [
        [
          # open app launcher
          "CTRL SHIFT, SPACE, exec,rofi -show drun -show-icons"
          "SUPER, SPACE, exec,rofi -show drun -show-icons"
          "SUPER, S, exec,rofi -show drun -show-icons"

          "SUPER, RETURN, exec, alacritty"

          "SUPER, ESCAPE, exec, [fullscreen:1] wlogout"

          # close window
          "SUPER, X, killactive"



          "Super, mouse_up, workspace, e+0"

          # allow special layer
          "SUPER, C, movetoworkspace, special"
          "ALT, TAB, togglespecialworkspace"

          # debug
          "SUPER, F5, forcerendererreload"
        ]
        (
          lib.lists.map
            (x: (x: [
              "CTRL, ${x}, workspace, ${x}"
              "SUPER, ${x}, movetoworkspace, ${x}"
            ]) (builtins.toString x))
            (lib.range 1 8)
        )
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

  programs.wlogout = {
    enable = true;
    style = with config.colorScheme.palette; ''
      * {
        font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
      	background-image: none;
      	transition: 20ms;
      }

      window {
      	background-color: rgba(0,0,0,0);
      }

      button {
      	color: #FFFFFF;
        font-size:20px;

        background-repeat: no-repeat;
      	background-position: center;
      	background-size: 25%;

      	border-style: solid;
      	background-color: rgba(12, 12, 12, 0.3);
      	border: 3px solid #FFFFFF;

        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }

      button:focus,
      button:active,
      button:hover {
          color: #${base06};
      	background-color: rgba(12, 12, 12, 0.5);
      	border: 3px solid #${base06};
      }

      /* 
      ----------------------------------------------------- 
      Buttons
      ----------------------------------------------------- 
      */

      #lock {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/lock.png"));
      }

      #logout {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/logout.png"));
      }

      #suspend {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/suspend.png"));
      }

      #hibernate {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/hibernate.png"));
      }

      #shutdown {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/shutdown.png"));
      }

      #reboot {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/reboot.png"));
      }

    '';
  };
}


