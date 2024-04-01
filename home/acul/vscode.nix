{ inputs, config, pkgs, ... }:

{

  programs.vscode = {
    enable = true;

    # disallow manually editing extensions
    mutableExtensionsDir = false;

    extensions = with pkgs.nix-vscode-extensions; [
      # # Basic
      mhutchie.git-graph
      vscodevim.vim
      # Codeium.codeium

      # # Nix & Nixos
      jnoortheen.nix-ide

      # # Rust
      rust-lang.rust-analyzer
      bungcip.better-toml
      serayuzgur.crates
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
}
