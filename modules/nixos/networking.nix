{ config, lib, pkgs, inputs, ... }:

with lib;
{

  config = {
    networking.useDHCP = lib.mkDefault true;
    networking.networkmanager.enable = true;
  };
}
