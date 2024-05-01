{ inputs, pkgs, ... }:

{
  woelfchen = {
    firefox.enable = true;
    vscode.enable = true;
    zsh.enable = true;
    network-manager.enable = true;
    hyprland = {
      enable = true;
    };
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
