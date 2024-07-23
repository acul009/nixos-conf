{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.nix-ld = {
    enable = mkEnableOption "";
  };

  config = mkIf config.woelfchen.nix-ld.enable {
    programs.nix-ld.enable = true;
  };
}
