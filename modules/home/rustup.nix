{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.rustup = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.rustup.enable {

    home.packages = with pkgs; [
      rustup
    ];
  };

}
