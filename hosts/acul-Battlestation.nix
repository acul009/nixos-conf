
{ lib, config, pkgs, ... }:

{
  imports = [
          ../configuration.nix
          ../modules/legacy/boot.nix
          ../modules/legacy/cli-tools.nix
          ../modules/legacy/user-acul.nix
          ../modules/legacy/localization.nix
          ../modules/legacy/plasma.nix
          ../modules/legacy/hyprland.nix
          ../modules/legacy/printing.nix
          ../modules/legacy/flatpak.nix
          ../modules/legacy/nvidia.nix
          ../modules/legacy/pipewire.nix
          ../modules/legacy/zsh.nix
          ../modules/legacy/overrides.nix
          ../modules/legacy/steam.nix
          ../modules/legacy/teamviewer.nix
          ../modules/legacy/partition-manager.nix
  ];
}