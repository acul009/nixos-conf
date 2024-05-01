{ lib, config, pkgs, ... }:

{
  imports = [
    ../modules/legacy/kommandozentrale/configuration.nix
  ];

  networking.hostName = "acul-Kommandozentrale";

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

    locale = "german";
    sound.enable = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/2cb9db2c-ebd6-4cb3-a0d7-f0c0dd16974a";
      fsType = "ext4";
      options = [
        "noatime"
        "nodiratime"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/C2E6-14A1";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
        "noatime"
        "nodiratime"
      ];
    };
  };

  swapDevices = [{ device = "/dev/disk/by-uuid/e0996296-f587-434f-811c-6824c53d520a"; }];


  system.stateVersion = "24.05"; # DO NOT CHANGE!!! FIRST INSTALLED VERSION
}
