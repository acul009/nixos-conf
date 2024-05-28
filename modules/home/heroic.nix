{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.heroic = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.heroic.enable {

    home.packages = with pkgs; [
      heroic
    ];
  };

}

