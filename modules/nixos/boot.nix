{ config, lib, pkgs, modulesPath, ... }:

with lib;
{
  options = {
    boot = {
      useGrub = mkOption {
        type = types.bool;
        default = true;
        description = ''
          Configures booting through grub
        '';
      };

      useEfi = mkOption {
        type = types.bool;
        description = ''
          tells the configuration to target efi systems
        ''
      };

      useOSProber = mkOption {
        type = types.bool;
        description = ''
          tells the configuration to use os-prober
        ''
      };

      useCStateLimiter = mkOption {
        type = types.bool;
        default = false;
        description = ''
          tells the configuration to limit the cstate to 5 on boot
        ''
      };

      processorVendor = mkOption {
        type = types.enum [ "amd" "intel" ];
      }


    };
  };

  config = mkIf config.boot.useGrub mkMerge [

    # default stuff
    {
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" ];
      boot.initrd.kernelModules = [ "dm-snapshot" ];
      boot.extraModulePackages = [ ];
    }

    # efi config
    mkIf config.boot.useEfi {
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.device = "nodev";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = "/boot";
    }

    mkIf config.boot.useOSProber {
      boot.loader.osProber.enable = true;
    }

    mkIf config.boot.useCStateLimiter {
      boot.kernelParams = [
        "processor.max_cstate=5"
      ];
    }

    mkIf config.boot.processorVendor == "amd" {
      boot.kernelModules = [
        "kvm-amd"
        "edac_mce_amd"
      ]
    }

  ];

}