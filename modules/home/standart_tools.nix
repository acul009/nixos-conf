{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.standart_tools = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.standart_tools.enable {

    home.packages = with pkgs; [
      vlc
      libvlc
    ];
  };

}
