{ inputs, config, pkgs, ... }:
let
  extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in
{

  programs.vscode = {
    enable = true;

    # disallow manually editing extensions
    mutableExtensionsDir = false;

    package = pkgs.vscodium;

    extensions = with extensions.open-vsx; [
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
