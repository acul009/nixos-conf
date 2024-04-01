{ lib, config, pkgs, services, ... }:

{
  services.printing.enable = true;

  hardware.sane.enable = true; # enables support for SANE scanners
  hardware.sane.extraBackends = [ pkgs.sane-airscan pkgs.hplipWithPlugin pkgs.utsushi ];
  services.udev.packages = [ pkgs.utsushi ];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
