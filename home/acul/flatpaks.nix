{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules
  ];

  services.flatpak.packages = [
    "com.discordapp.Discord"
    "com.github.tchx84.Flatseal"
    "com.valvesoftware.Steam"
    "org.signal.Signal"
  ];
}
