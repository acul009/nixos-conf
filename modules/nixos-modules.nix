{ ... }:
{
  imports = [
    ./nixos/allow-unfree.nix
    ./nixos/boot.nix
    ./nixos/cli-tools.nix
    ./nixos/default-timezone.nix
    ./nixos/git.nix
    ./nixos/locale.nix
    ./nixos/networking.nix
    ./nixos/sound.nix
    ./nixos/user.nix
    ./nixos/zsh.nix
  ];
}
