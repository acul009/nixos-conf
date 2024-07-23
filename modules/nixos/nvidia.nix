{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.nvidia = {
    enable = mkEnableOption "";
    prime = {
      enable = mkEnableOption "";

      intelBusId = mkOption {
        type = types.string;
      };

      nvidiaBusId = mkOption {
        type = types.string;
      };
    };
  };

  config = mkIf config.woelfchen.nvidia.enable (mkMerge [
    ({

      environment.sessionVariables = {
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        LIBVA_DRIVER_NAME = "nvidia";

        # might cause issues if turned on
        __GL_VRR_ALLOWED = "0";

        # might fix flickering - legacy interface
        # WLR_DRM_NO_ATOMIC = "1";

      };

      # Enable OpenGL (soon tm)
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };


      # Enable OpenGL
      # hardware.opengl = {
      #   enable = true;
      #   enable32Bit = true;
      # };


      # Load nvidia driver for Xorg and Wayland
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {

        # Modesetting is required.
        modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        powerManagement.enable = false;
        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Use the NVidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of 
        # supported GPUs is at: 
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
        # Only available from driver 515.43.04+
        # Currently alpha-quality/buggy, so false is currently the recommended setting.
        open = true;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };

      # hardware acceleration
      environment.systemPackages = with pkgs; [
        libva-utils
        vdpauinfo
      ];

      # incompatible with kernel later than 6.8
      boot.kernelPackages = mkForce pkgs.linuxPackages_6_8;
    })

    (mkIf config.woelfchen.nvidia.prime.enable {
      hardware.nvidia.prime = {
        sync.enable = true;

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        # Make sure to use the correct Bus ID values for your system!
        nvidiaBusId = config.woelfchen.nvidia.prime.nvidiaBusId;
        intelBusId = config.woelfchen.nvidia.prime.intelBusId;
        # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
      };
    })

    (mkIf config.services.displayManager.sddm.enable {
      # sddm with wayland doesn't work with nvidia
      services.displayManager.sddm.wayland.enable = mkForce false;
      services.xserver.enable = true;
    })

  ]);
}
