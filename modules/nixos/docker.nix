{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.docker = {
    enable = mkEnableOption "";
  };

  config = mkIf config.woelfchen.docker.enable {
    virtualisation.docker.enable = true;

  };
}
