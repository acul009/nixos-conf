{ config, lib, pkgs, modulesPath, ... }:

with lib;
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  options = {
    woelfchen.boot = {
      useGrub = mkEnableOption "";

      useEfi = mkOption {
        type = types.bool;
        description = ''
          tells the configuration to target efi systems
        '';
      };

      useOSProber = mkOption {
        type = types.bool;
        default = mkIf (!config.boot.useGrub) false;
        description = ''
          tells the configuration to use os-prober
        '';
      };

      useCStateLimiter = mkOption {
        type = types.bool;
        default = false;
        description = ''
          tells the configuration to limit the cstate to 5 on boot
        '';
      };

      processorVendor = mkOption {
        type = types.enum [ "amd" "intel" ];
      };


    };
  };

  config = mkIf config.woelfchen.boot.useGrub (mkMerge [

    # default stuff
    {
      boot.loader.grub.enable = true;
      boot.kernelPackages = mkDefault pkgs.linuxPackages_latest;
      boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
      boot.initrd.kernelModules = [ "dm-snapshot" ];
      boot.extraModulePackages = [ ];
      hardware.enableRedistributableFirmware = true;
    }

    # efi config
    (mkIf config.woelfchen.boot.useEfi {
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.device = "nodev";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = "/boot";
    })

    (mkIf config.woelfchen.boot.useOSProber {
      boot.loader.grub.useOSProber = true;
    })

    (mkIf config.woelfchen.boot.useCStateLimiter {
      boot.kernelParams = [
        "processor.max_cstate=5"
      ];
    })

    (mkIf (config.woelfchen.boot.processorVendor == "amd") {
      boot.kernelModules = [
        "kvm-amd"
        "edac_mce_amd"
      ];
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = true;
    })

    (mkIf (config.woelfchen.boot.processorVendor == "intel") {
      boot.kernelModules = [
        "kvm-intel"
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = true;
    })
  ]);

}
