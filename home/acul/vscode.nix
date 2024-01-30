{ inputs, config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;

    # disallow manually editing extensions
    mutableExtensionsDir = false;

    extensions = with pkgs.vscode-extensions; [
      # # Basic
      # mhutchie.git-graph
      # vscodevim.vim
      # Codeium.codeium

      # # Nix & Nixos
      # jnoortheen.nix-ide

      # # Rust
      rust-lang.rust-analyzer
      # bungcip.better-toml
      # serayuzgur.crates
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [

      # General
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.27.2";
        sha256 = "O5G4yhvD2HvKb4Vbvr1v20nMEQq88f5RE+X50bZvr1Q=";
      }
      {
        name = "git-graph";
        publisher = "mhutchie";
        version = "1.30.0";
        sha256 = "sHeaMMr5hmQ0kAFZxxMiRk6f0mfjkg2XMnA4Gf+DHwA=";
      }
      {
        name = "codeium";
        publisher = "Codeium";
        version = "1.6.24";
        sha256 = "pPQaOXqkDf5F7BJkr4CPRdohlPxL3nyPPH+y+Uh0490=";
      }

      # Nix
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.2.2";
        sha256 = "jwOM+6LnHyCkvhOTVSTUZvgx77jAg6hFCCpBqY8AxIg=";
      }

      # Development
      {
        name = "nix-env-selector";
        publisher = "arrterian";
        version = "1.0.10";
        sha256 = "b3Sr0bwU2VJgl2qcdsUROZ3jnK+YUuzJMySvSD7goj8=";
      }

      # Rust
      # {
      #   name = "rust-analyzer";
      #   publisher = "rust-lang";
      #   version = "0.3.1807";
      #   sha256 = "4ZMBuDzUlaVXGerG2R2fwEzaHhIelUX4Bur8EaDbb4o=";
      # }
      {
        name = "better-toml";
        publisher = "bungcip";
        version = "0.3.2";
        sha256 = "g+LfgjAnSuSj/nSmlPdB0t29kqTmegZB5B1cYzP8kCI=";
      }
      {
        name = "crates";
        publisher = "serayuzgur";
        version = "0.6.5";
        sha256 = "HgqM4PKGk3R5MLY4cVjKxv79p5KlOkVDeDbv7/6FmpM=";
      }


      # Golang
      {
        name = "Go";
        publisher = "golang";
        version = "0.40.3";
        sha256 = "FWC9ALnp5ZsUqHFOPS5CcKsqf5O6rpr4oMfenvZlcZY=";
      }


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
