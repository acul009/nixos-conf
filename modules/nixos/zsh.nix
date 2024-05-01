{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.zsh = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf config.woelfchen.zsh.enable {

    programs.zsh = {
      enable = true;
    };


    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];

    users.defaultUserShell = pkgs.zsh;
  };
}