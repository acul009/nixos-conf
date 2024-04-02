{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak.uninstallUnmanaged = true;
  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
    "org.mozilla.firefox"
    "net.davidotek.pupgui2" # protonup
    "org.signal.Signal"
    "org.prismlauncher.PrismLauncher"
    "org.torproject.torbrowser-launcher"
  ];
}
