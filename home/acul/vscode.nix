{ inputs, config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodeium;
    extensions = with pkgs.vscode-extensions; [
      mhutchie.git-graph

      vscodevim.vim
    ];
  };
}
