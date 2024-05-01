{ lib, config, pkgs, programs, ... }:

{
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
}
