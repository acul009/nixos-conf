{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.scanning.enable = mkEnableOption "";

  config = mkIf (config.woelfchen.scanning.enable) {
    hardware.sane.enable = true;

    hardware.sane.extraBackends = [ pkgs.sane-airscan ];

  };

}
