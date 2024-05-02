{ config, lib, ... }:

with lib;
{
  options.woelfchen.locale = mkOption {
    type = types.enum [ "german" ];
  };

  config = mkIf (config.woelfchen.locale == "german") {

    console = {
      font = "Lat2-Terminus16";
      useXkbConfig = true; # use xkb.options in tty.
    };

    i18n.defaultLocale = "de_DE.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };

    services.xserver.xkb = {
      layout = "de";
      variant = "";
    };
  };

}
