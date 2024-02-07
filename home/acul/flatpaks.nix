{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak.packages = [
    "org.mozilla.firefox"
    "com.discordapp.Discord"
    "com.github.tchx84.Flatseal"
    "com.valvesoftware.Steam"
    "org.signal.Signal"
    "org.prismlauncher.PrismLauncher"
    "org.torproject.torbrowser-launcher"
  ];
}
