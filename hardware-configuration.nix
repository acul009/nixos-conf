# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" "edac_mce_amd" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [
    "processor.max_cstate=5"
  ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/cfffcc15-e815-44d1-984f-898700cd099f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/7340-6AA1";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-0bcf22661c4b.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-173f93518866.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-29dfa4a8e338.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-43fc6c694e0e.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-46a304bb778a.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-475e18461566.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-60a1243b9335.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-79f930835b25.useDHCP = lib.mkDefault true;
  # networking.interfaces.br-d2bbefcd48d7.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.Luca.useDHCP = lib.mkDefault true;
  # networking.interfaces.tailscale0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # log hardware errors
  hardware.mcelog.enable = true;
}
