{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.steam = {
    enable = mkEnableOption "";
  };

  config = mkIf config.woelfchen.steam.enable {
    programs.steam =
      {
        enable = true;
        gamescopeSession.enable = true;
      };

    hardware.steam-hardware.enable = true;

    programs.gamemode.enable = true;


    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
