{ lib, config, pkgs, ... }:

{
  imports = [
    ../modules/legacy/printing.nix
    ../modules/legacy/flatpak.nix
    ../modules/legacy/teamviewer.nix
    ../modules/legacy/partition-manager.nix
  ];

  networking.hostName = "acul-Battlestation";

  woelfchen = {
    boot = {
      useGrub = true;
      useEfi = true;
      useOSProber = true;
      useCStateLimiter = true;
      processorVendor = "amd";
    };
    #nvidia.enable = true;

    user.username = "acul";
    locale = "german";
    sound.enable = true;
    hyprland.enable = true;
    plasma.enable = true;
    steam.enable = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/cfffcc15-e815-44d1-984f-898700cd099f";
      fsType = "ext4";
      options = [
        "noatime"
        "nodiratime"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7680-6148";
      fsType = "vfat";
      options = [
        "noatime"
        "nodiratime"
      ];
    };
  };
  swapDevices = [ ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
