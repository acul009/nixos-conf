{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.experimental = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf config.woelfchen.experimental.enable {
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
