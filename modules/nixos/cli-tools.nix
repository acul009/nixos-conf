{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.cli-tools = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf config.woelfchen.cli-tools.enable {
    environment.systemPackages = with pkgs; [
      bash
      dig
      htop
      killall
      nano
      nmap
      vim
      wget
      lshw
    ];
  };
}
