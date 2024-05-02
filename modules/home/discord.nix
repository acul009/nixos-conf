{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.discord = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.discord.enable {

    home.packages = with pkgs; [
      vesktop
    ];
  };

}
