{ config, pkgs, ... }:

{
  programs.vscode = {
    extensions = [
      # Base
      "vscodevim.vim"
      "mhutchie.git-graph"
      "Codeium.codeium"

      # Nix & Nixos
      "jnoortheen.nix-ide"

      # Rust
      "rust-lang.rust-analyzer"
      "bungcip.better-toml"
      "serayuzgur.crates"
    ];
    userSettings = {
      "editor.formatOnSave" = true;
    };
  };
}
