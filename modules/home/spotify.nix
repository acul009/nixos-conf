{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.spotify = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.spotify.enable {

    home.packages = with pkgs; [
      spotify
    ];
  };

}
