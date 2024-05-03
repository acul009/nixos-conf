{ lib, config, pkgs, ... }:

{
  imports = [
    # ../configuration.nix
    # ../modules/legacy/boot.nix
    # ../modules/legacy/cli-tools.nix
    # ../modules/legacy/user-acul.nix
    # ../modules/legacy/localization.nix
    # ../modules/legacy/plasma.nix
    # ../modules/legacy/hyprland.nix
    ../modules/legacy/printing.nix
    ../modules/legacy/flatpak.nix
    # ../modules/legacy/nvidia.nix
    # ../modules/legacy/pipewire.nix
    # ../modules/legacy/zsh.nix
    # ../modules/legacy/overrides.nix
    # ../modules/legacy/steam.nix
    ../modules/legacy/teamviewer.nix
    ../modules/legacy/partition-manager.nix
  ];

  woelfchen = {
    user.username = "acul";
    locale = "german";

    boot = {
      useGrub = true;
      useEfi = true;
      useOSProber = true;
      processorVendor = "amd";
      useCStateLimiter = true;
    };

    hyprland.enable = true;
    nvidia.enable = true;
    sound.enable = true;
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
        "fmask=0022"
        "dmask=0022"
        "noatime"
        "nodiratime"
      ];
    };
  };

  system.stateVersion = "24.05";
}
