{ config, lib, pkgs, ... }:

with lib;
{
  options.woelfchen.lutris = {
    enable = mkEnableOption "";

  };

  config = mkIf config.woelfchen.lutris.enable {

    home.packages = with pkgs; [
      (lutris.override {
        extraLibraries = pkgs: [
          dxvk

          # wine-staging (version with experimental features)
          wineWowPackages.staging

          # winetricks (all versions)
          winetricks

          # native wayland support (unstable)
          wineWowPackages.waylandFull
          # List library dependencies here
        ];
      })
    ];
  };

}
