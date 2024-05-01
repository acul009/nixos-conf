
{ lib, config, pkgs, ... }:

{
  imports = [
    ../modules/legacy/kommandozentrale/configuration.nix
  ];

  woelfchen = {
    boot = {
      useGrub = true;
      useEfi = true;
      useOSProber = true;
      processorVendor = "intel";
    };

    user = {
      username = "acul";
    };
  };

  system.stateVersion = "24.05"; # DO NOT CHANGE!!! FIRST INSTALLED VERSION
}