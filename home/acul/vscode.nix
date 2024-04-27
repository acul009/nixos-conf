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
