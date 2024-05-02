{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.experimental = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf config.woelfchen.experimental.enable {
    programs.git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };

        credential.helper = "cache --timeout=3600";
      };
    };
  };
}
