{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.scanning = {
    enable = mkEnableOption "";

  };

  config = mkIf (config.woelfchen.scanning.enable) {

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # doesnt work :(
    environment.etc."sane-config/xerox_mfp.conf".text = mkForce "tcp 192.168.44.30";

    hardware.sane = {
      enable = true;
      openFirewall = true;


      netConf = strings.concatStringsSep "\n" config.woelfchen.scanning.ips;

      extraBackends = [ pkgs.sane-airscan ];
    };


  };

}
