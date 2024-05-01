{ config, lib, pkgs, inputs, ... }:

with lib;
{
  options.woelfchen.git = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf config.woelfchen.git.enable {
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