{ config, lib, ... }:

with lib;
{
  options.woelfchen.sound =
    {
      enable = mkEnableOption "";
    };

  config = mkIf (config.woelfchen.sound.enable) {

    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

  };

}
