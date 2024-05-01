{ config, lib, ... }:

with lib;
{
  config = {
    time.timeZone = mkDefault "Europe/Berlin";
  };
}
