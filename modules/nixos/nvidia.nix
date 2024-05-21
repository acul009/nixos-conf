{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.nvidia = {
    enable = mkEnableOption "";
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

        ELECTRON_OZONE_PLATFORM_HINT = "wayland";

        # nixos function
        NIXOS_OZONE_WL = 1;
      };

      # Enable OpenGL
      hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };

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
        open = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
          version = "555.42.02";
          sha256_64bit = "sha256-k7cI3ZDlKp4mT46jMkLaIrc2YUx1lh1wj/J4SVSHWyk=";
          sha256_aarch64 = lib.fakeSha256;
          openSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
          settingsSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
          persistencedSha256 = lib.fakeSha256;
        };
      };

      # hardware acceleration
      environment.systemPackages = with pkgs; [
        libva-utils
        vdpauinfo
      ];
    })

    (mkIf config.services.displayManager.sddm.enable {
      # sddm with wayland doesn't work with nvidia
      services.displayManager.sddm.wayland.enable = mkForce false;
      services.xserver.enable = true;
    })

  ]);
}
