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
    ./nixos/plasma.nix
    ./nixos/sound.nix
    ./nixos/user.nix
    ./nixos/zsh.nix
  ];
}
