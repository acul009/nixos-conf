{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.plasma = {
    enable = mkEnableOption "";
  };

  config = mkIf config.woelfchen.plasma.enable {

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;

  };
}
