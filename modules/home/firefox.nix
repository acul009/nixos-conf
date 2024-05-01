{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.firefox = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.firefox.enable {

    home.packages = with pkgs; [
      firefox
    ];
  };

}
