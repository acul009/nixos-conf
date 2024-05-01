{ config, lib, ... }:

with lib;
{
  config = {

    nixpkgs.config.allowUnfree = mkDefault true;
  };
}
