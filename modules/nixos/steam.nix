{ lib, config, pkgs, programs, ... }:

{
  programs.steam =
    {
      enable = true;
      gamescopeSession.enable = true;
    };

  hardware.steam-hardware.enable = true;
}
