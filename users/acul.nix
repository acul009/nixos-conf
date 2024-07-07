{ inputs, pkgs, ... }:

{
  woelfchen = {
    chromium.enable = true;
    discord.enable = true;
    firefox.enable = true;
    vscode.enable = true;
    zsh.enable = true;
    network-manager.enable = true;
    spotify.enable = true;
    heroic.enable = true;
    hyprland = {
      enable = true;
      monitors = [
        "desc:Iiyama North America PLX2472HC 1153270400628, 1920x1080@60, 0x460, 1"

        "desc:Microstep MSI MAG321CQR KA3H028500018, 2560x1440@144, 1920x0, 1"

        "Unknown-1,disable"
      ];
    };
    rustup.enable = true;
    kde.tools.enable = true;
  };


  programs.git = {
    enable = true;
    userName = "acul009";
    userEmail = "acul009@gmail.com";
    extraConfig = {
      credential.helper = "cache --timeout=36000";
    };
  };
}
