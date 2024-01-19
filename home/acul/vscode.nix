{ inputs, config, pkgs, ... }:

{


  imports = [
    inputs.nix-vscode-extensions
  ];


  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = [
      # Base
      open-vsx.vscodevim.vim
      # pkgs.vscode-extensions.mhutchie.git-graph

      # "vscodevim.vim"
      # "mhutchie.git-graph"
      # "Codeium.codeium"

      # # Nix & Nixos
      # "jnoortheen.nix-ide"

      # # Rust
      # "rust-lang.rust-analyzer"
      # "bungcip.better-toml"
      # "serayuzgur.crates"
    ];
    userSettings = {
      "editor.formatOnSave" = true;
    };
  };
}
