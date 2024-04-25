{ inputs, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
  };
  programs.starship.enableZshIntegration = true;
  programs.dircolors.enableZshIntegration = true;

  programs.starship = {
    enable = true;
    settings = {

      add_newline = false;
      format = ''
        $fill\   [ $status $cmd_duration\]   $fill
        $os$shlvl$username@$shell$directory$git_branch$git_commit$git_state$git_status$jobs$sudo$nix_shell$character
      '';

      fill = {
        symbol = "-";
        style = "";
      };

      status = {
        disabled = false;
        success_symbol = "✅";
        format = "[$symbol]($style)";
      };

      cmd_duration = {
        disabled = false;
        min_time = 0;
      };

      os = {
        disabled = false;
        symbols = {
          NixOs = "❄️ ";
        };
      };

      shlvl = {
        disabled = false;
        symbol = "λ ";
      };

      sudo = {
        disabled = false;
        format = "[$symbol]($style)";
      };

      username = {
        disabled = false;
        show_always = true;
        format = "[$user]($style)";
        style_user = "bright-white bold";
        style_root = "bright-red bold";
      };

      shell = {
        disabled = false;
        format = "$indicator";
        fish_indicator = "";
        bash_indicator = "[BASH](bright-white) ";
        zsh_indicator = "[ZSH](bright-white) ";
      };

      directory = {
        disabled = false;
        home_symbol = "🏠";
      };

      git_state = {
        disabled = true;
      };

      git_status = {
        disabled = true;
      };

      nix_shell = {
        disabled = false;
        impure_msg = "";
        symbol = "❄️ ";
        format = "[$symbol$state]($style) ";
      };

      haskell.symbol = " ";
    };
  };

  programs.dircolors.enable = true;
  programs.dircolors.extraConfig = ''
    TERM alacritty
  '';
  programs.dircolors.settings = {
    ".iso" = "01;31"; # .iso files bold red like .zip and other archives
    ".gpg" = "01;33"; # .gpg files bold yellow
    # Images to non-bold magenta instead of bold magenta like videos
    ".bmp" = "00;35";
    ".gif" = "00;35";
    ".jpeg" = "00;35";
    ".jpg" = "00;35";
    ".mjpeg" = "00;35";
    ".mjpg" = "00;35";
    ".mng" = "00;35";
    ".pbm" = "00;35";
    ".pcx" = "00;35";
    ".pgm" = "00;35";
    ".png" = "00;35";
    ".ppm" = "00;35";
    ".svg" = "00;35";
    ".svgz" = "00;35";
    ".tga" = "00;35";
    ".tif" = "00;35";
    ".tiff" = "00;35";
    ".webp" = "00;35";
    ".xbm" = "00;35";
    ".xpm" = "00;35";
  };
}
