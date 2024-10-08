{ config, lib, pkgs, inputs, ... }:

with lib;
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];


  options.woelfchen.hyprland = {
    enable = mkEnableOption "";

    monitors = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };

  };

  config = mkIf config.woelfchen.hyprland.enable {

    # nix colors
    colorScheme = inputs.nix-colors.colorSchemes.darcula;

    # requirements
    home.packages = with pkgs;      [

      #media control
      playerctl

      # file manager
      nautilus

      # policykit agent
      lxqt.lxqt-policykit

      # screenshots
      grim
      slurp

      kdePackages.ark

      wtype
      wl-clipboard-rs
    ];


    # Hyprland config

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
        ];

        input = {
          kb_layout = "de";
          numlock_by_default = true;

          sensitivity = -0.2;
          # mouse acceleration
          accel_profile = "flat";

          # Logitech (not working)
          # emulate_discrete_scroll = 1;
          # scroll_factor = 1;

          touchpad = {
            natural_scroll = true;
            scroll_factor = 0.3;
          };
        };

        gestures = {
          workspace_swipe = true;
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

            # print clipboard
            "SUPER, V, exec, bash -c 'sleep 1; wl-paste -n | wtype -'"

            # Screenshot
            ", Print, exec, grim -g \"$(slurp)\""

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

        env = [
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "LIBVA_DRIVER_NAME,nvidia"
        ];

        monitor = config.woelfchen.hyprland.monitors ++ [
          # default values
          ",preferred,auto,1"
        ];

        misc = {
          force_default_wallpaper = 2;
        };
      };
    };


    # Alacritty as terminal

    programs.alacritty.enable = true;
    programs.alacritty.settings = {
      window.opacity = 0.8;
      colors = with config.colorScheme.palette; {
        bright = {
          black = "0x${base00}";
          blue = "0x${base0D}";
          cyan = "0x${base0C}";
          green = "0x${base0B}";
          magenta = "0x${base0E}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base09}";
        };
        cursor = {
          cursor = "0x${base06}";
          text = "0x${base06}";
        };
        normal = {
          black = "0x${base00}";
          blue = "0x${base0D}";
          cyan = "0x${base0C}";
          green = "0x${base0B}";
          magenta = "0x${base0E}";
          red = "0x${base08}";
          white = "0x${base06}";
          yellow = "0x${base0A}";
        };
        primary = {
          background = "0x${base00}";
          foreground = "0x${base06}";
        };
      };
    };


    # Waybar status bar

    programs.waybar = {
      enable = true;
      style = ''

        * {
          padding: 0;
          margin: 0;
          min-height: 0;
        }

        window#waybar {
          background-color: transparent;
          border-bottom: none;
          color: white;
        }

        tooltip {
          background: rgba(43, 48, 59, 0.5);
          border: 1px solid rgba(100, 114, 125, 0.8);
        }
        tooltip label {
          color: white;
        }

        menu, .menu, .context-menu.context-menu {
          padding: 6px 6px; 
          background: rgba(43, 48, 59, 0.8);
          border: 1px solid rgba(100, 114, 125, 0.8);
        }

        menu menuitem, .menu menuitem, .context-menu menuitem {
          margin: 0;
          border-radius: 6px;
          padding: 7px 6px;
        }


        #clock {
          font-size: 36px;
          padding: 10px 20px 0 10px;
        }

        #battery, #battery.charging, #battery.plugged {
          color: #00ff00;
        }

        #battery {
          font-size: 18px;
        }

        #image-album-art, #window, #workspaces, #mpris, #systemstatus, #tray {
          border-radius: 10px;
          margin: 10px 10px 0 10px;
          border: 1px solid rgba(100, 114, 125, 0.8);
          background: rgba(43, 48, 59, 0.5);
        }

        #window {
          margin-left: 20px;
        }

        #window, #systemstatus, #tray {
          padding: 0 12px;
        }

        #cpu, #memory, #battery, #bluetooth {
          padding: 0 8px;
        }

        #workspaces button {
          padding: 0 12px;
          border-radius: 10px;
        }

        #workspaces button:hover {
          background: rgba(100, 114, 125, 0.2);
        }

        #workspaces button.active, #workspaces button.hosting-monitor {
          background: rgba(100, 114, 125, 0.2);
        }

      '';

      settings = {
        mainbar = {
          layer = "top";
          position = "top";
          height = 50;

          modules-left = [ "hyprland/window" ];
          modules-center = [ "hyprland/workspaces" ];
          modules-right = [ "tray" "group/systemstatus" "clock" ];

          "image/album-art" = {
            # exec = ../../scripts/album_art.sh;
            path = "$HOME/.cache/current-song";
            size = 32;
            interval = 30;
          };

          "custom/media" = {
            "format" = "{icon}{}";
            "return-type" = "json";
            "format-icons" = {
              "Playing" = " ";
              "Paused" = " ";
            };
            "max-length" = 70;
            "exec" = ''playerctl -a metadata --format '{"text": "{{playerName}}: {{artist}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F'';
            "on-click" = "playerctl play-pause";
          };

          "hyprland/window" = {
            format = "    {}";
            separate-outputs = true;

            rewrite = {
              " (.*) Mozilla Firefox" = " $1";
              " (.*) - VSCodium" = " $1";
              " .*Discord \\|(.*)" = "   $1";
              " (.*)Alacritty" = " $1Alacritty";
              " (.*)Steam" = "󰓓 $1Steam";
            };
          };

          "hyprland/workspaces" = {
            all-outputs = true;
            move-to-monitor = true;
            window-rewrite = {
              "class<firefox>" = "󰈹";
            };
          };

          "group/systemstatus" = {
            orientation = "horizontal";
            modules = [
              "user"
              "cpu"
              "memory"
              "battery"
              "bluetooth"
            ];
          };

          user = {
            format = "  {user}  ";
          };

          cpu = {
            format = "  {usage}%";
            max-length = 10;
          };

          memory = {
            format = "   {}%";
            max-length = 10;
          };

          bluetooth = {
            format-no-controller = "";
          };

          clock = {
            timezone = "Europe/Berlin";
          };

          tray = {
            show-passive-items = true;
            icon-size = 21;
            spacing = 10;
          };

          battery = {
            format = "{capacity}% {icon}";
            format-icons = [ "" "" "" "" "" ];

            states = {
              warning = 30;
              critical = 15;
            };
          };

        };
      };
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


    # Mako notification daemon

    services.mako = with config.colorScheme.palette; {
      enable = true;
      backgroundColor = "#${base01}";
      borderColor = "#${base0E}";
      borderRadius = 5;
      borderSize = 2;
      textColor = "#${base04}";
      layer = "overlay";
    };

  };

}
