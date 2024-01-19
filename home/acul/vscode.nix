{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
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
