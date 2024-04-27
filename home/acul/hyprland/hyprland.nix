{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    lxqt.lxqt-policykit
  ];

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
        "waybar"
        "${pkgs.swww}/bin/swww init"
        "lxqt-policykit-agent"
        # "${pkgs.eww}/bin/eww daemon && eww open bar"
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
          "SUPER, SPACE, exec,rofi -show drun -show-icons"
          "SUPER, S, exec,rofi -show drun -show-icons"

          "SUPER, RETURN, exec, alacritty"

          "SUPER, ESCAPE, exec, [fullscreen:1] wlogout"

          # close window
          "SUPER, X, killactive"

          # Screenshot
          ", Print, exec, grim -g \"$(slurp)\""

          "Super, mouse_up, workspace, e+0"

          # allow special layer
          "SUPER, C, movetoworkspace, special"
          "ALT, TAB, togglespecialworkspace"

          # debug
          "SUPER, F5, forcerendererreload"
          "SUPER, F5, exec, eww reload"
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

  # waybar
  programs.waybar = {
    enable = true;
    style = ''
      ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}

      window#waybar {
        background: transparent;
        border-bottom: none;
      }

      #clock {
        font-size: 36px;
        padding-left: 10px;
        padding-right: 10px;
        background-color: transparent;
      }

      #tray {
        background-color: transparent;
      }
    '';

    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        height = 50;

        modules-left = [ ];
        modules-center = [ ];
        modules-right = [ "tray" "clock" ];

        clock = {
          timezone = "Europe/Berlin";
        };

        tray = {
          show-passive-items = true;
          icon-size = 21;
          spacing = 10;
        };

      };
    };
  };

  # eww Widgets

  programs.eww = {
    enable = true;
    configDir = ./eww;
  };

  # Rofi application launcher

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [ pkgs.rofi-calc pkgs.rofi-emoji pkgs.rofi-systemd ];
    terminal = "alycritty";
    extraConfig = {
      modi = "drun,run";
    };
    theme =
      let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; => foo: "abc";
        #   bar = mkLiteral "abc"; => bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      with config.colorScheme.palette;
      {
        "*" = {
          foreground-color = mkLiteral "#${base06}";
          text-color = mkLiteral "#${base06}";
          border-color = mkLiteral "#${base09}";
          background-color = mkLiteral "transparent";
        };

        "#window" = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "500px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";

          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border-radius = mkLiteral "40px";
          cursor = "default";
          background-color = mkLiteral "#${base00}80";
        };

        "#mainbox" = {
          enabled = true;
          spacing = mkLiteral "20px";
          padding = mkLiteral "40px";
          border-radius = mkLiteral "40px";
          children = [ "inputbar" "listview" ];
        };

        "#inputbar" = {
          enabled = true;
          spacing = mkLiteral "15px";
          margin = mkLiteral "0px";
          border = mkLiteral "2px";
          border-radius = mkLiteral "20px";
          children = [ "textbox-prompt-colon" "entry" ];
        };

        "#textbox-prompt-colon" = {
          enabled = true;
          expand = false;
          padding = mkLiteral "0px 0px 0px 20px";
          border-radius = mkLiteral "8px";
          vertical-align = mkLiteral "0.5";
          str = ">";
        };

        "#entry" = {
          enabled = true;
          padding = mkLiteral "16px 0px";
          border = mkLiteral "0px";
          cursor = "test";
          vertical-align = mkLiteral "0.5";
        };

        "#listview" = {
          enabled = true;
          columns = 1;
          lines = 5;
          cycle = true;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;

          spacing = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          cursor = "default";
        };

        "#element" = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "10px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          cursor = mkLiteral "pointer";
        };

        "#element selected.normal" = {
          background-image = mkLiteral "linear-gradient(to right, #${base01}A0, #${base02}A0)";
        };

        "#element-icon" = {
          size = mkLiteral "48px";
          cursor = mkLiteral "inherit";
        };

        "#element-text" = {
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.5";
        };

      };
  };

  # wlogout 
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


