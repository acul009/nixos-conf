{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.printing = {
    enable = mkEnableOption "";
  };

  config = mkIf config.woelfchen.printing.enable {
    services.printing.enable = true;
  };
}
