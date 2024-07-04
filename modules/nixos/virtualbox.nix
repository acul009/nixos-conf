{ config, lib, pkgs, inputs, ... }:

with lib;
{

  options.woelfchen.virtualbox = {
    enable = mkEnableOption "";
  };


  config = mkIf config.woelfchen.virtualbox.enable
    {
      virtualisation.virtualbox.host.enable = true;
    };
}
