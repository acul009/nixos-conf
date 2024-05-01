{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.network-manager = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.network-manager.enable {

    services.network-manager-applet.enable = true;

  };

}
