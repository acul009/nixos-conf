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
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.27.2";
        sha256 = "O5G4yhvD2HvKb4Vbvr1v20nMEQq88f5RE+X50bZvr1Q=";
      }
    ];

    userSettings = {
      "editor.formatOnSave" = true;
    };
  };
}
