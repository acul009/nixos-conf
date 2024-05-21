{ ... }:
{
  imports = [
    ./nixos/allow-unfree.nix
    ./nixos/boot.nix
    ./nixos/cli-tools.nix
    ./nixos/default-timezone.nix
    ./nixos/experimental-features.nix
    ./nixos/git.nix
    ./nixos/hyprland.nix
    ./nixos/locale.nix
    ./nixos/networking.nix
    ./nixos/nvidia.nix
    ./nixos/plasma.nix
    ./nixos/printing.nix
    ./nixos/scanning.nix
    ./nixos/sound.nix
    ./nixos/steam.nix
    ./nixos/user.nix
    ./nixos/zsh.nix
  ];
}
