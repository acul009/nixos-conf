{ inputs, config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # # Basic
      # mhutchie.git-graph
      # vscodevim.vim
      # Codeium.codeium

      # # Nix & Nixos
      # jnoortheen.nix-ide

      # # Rust
      # rust-lang.rust-analyzer
      # bungcip.better-toml
      # serayuzgur.crates
    ];

    userSettings = {
      "editor.formatOnSave" = true;
    };
  };
}
