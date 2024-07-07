{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.chromium = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.chromium.enable {

    programs.chromium.enable = true;
  };

}
