{ inputs, config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      mhutchie.git-graph

      vscodevim.vim
    ];
  };
}
