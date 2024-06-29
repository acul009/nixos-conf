{ config, inputs, lib, pkgs, ... }:

with lib;
let
  extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in
{
  options = {
    woelfchen.vscode = {
      enable = mkEnableOption "";

    };
  };


  config = mkIf config.woelfchen.vscode.enable {
    programs.vscode = {
      enable = true;

      # disallow manually editing extensions
      mutableExtensionsDir = false;

      package = pkgs.vscodium;

      extensions = with extensions; [
        # # Basic
        open-vsx.mhutchie.git-graph
        open-vsx.vscodevim.vim

        # # Nix & Nixos
        open-vsx.jnoortheen.nix-ide

        # # Rust
        open-vsx.rust-lang.rust-analyzer
        open-vsx.bungcip.better-toml
        open-vsx.serayuzgur.crates
        open-vsx.codeium.codeium

        # Go
        open-vsx.golang.go

        # Dart
        open-vsx.dart-code.dart-code
        open-vsx.dart-code.flutter

        # Svelte
        open-vsx.svelte.svelte-vscode

        # Nöön Live-Share
        vscode-marketplace.ms-vsliveshare.vsliveshare
      ];

      userSettings = {
        "window.titleBarStyle" = "custom";
        "editor.formatOnSave" = true;
        "git.confirmSync" = false;
        "git.autofetch" = true;
        "terminal.integrated.defaultProfile.linux" = "zsh";
        # "workbench.colorCustomizations" = with config.colorScheme.palette; {
        #   "menu.background" = "#${base08}";
        #   "sideBar.background" = "#${base01}";
        #   "panel.background" = "#${base00}";
        #   "editor.background" = "#${base00}";
        #   "banner.background" = "#${base02}";
        # };
      };
    };

    home.packages = with pkgs; [
      nixpkgs-fmt
    ];
  };

}
