{ lib, config, pkgs, ... }:

{
  networking.hostName = "acul-Kommandozentrale";

  woelfchen = {
    boot = {
      useGrub = true;
      useEfi = true;
      useOSProber = false;
      processorVendor = "intel";
    };

    user = {
      username = "acul";
    };

    locale = "german";
    sound.enable = true;
    hyprland = {
      enable = true;
      monitors = [
        "desc:Iiyama North America PLX2472HC 1153270400628, 1920x1080@60, 0x460, 1"

        "desc:Microstep MSI MAG321CQR KA3H028500018, 2560x1440@120, 1920x0, 1"
      ];
    };
    plasma.enable = true;
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
