{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak.uninstallUnmanaged = true;
  services.flatpak.packages = [
    "org.mozilla.firefox"
    "com.discordapp.Discord"
    "com.github.tchx84.Flatseal"
    "net.davidotek.pupgui2" # protonup
    "org.signal.Signal"
    "org.prismlauncher.PrismLauncher"
    "org.torproject.torbrowser-launcher"
  ];
}
