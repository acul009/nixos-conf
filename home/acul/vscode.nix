{ config, pkgs, ... }:

{
  programs.vscode = {
    extensions = [
      "jnoortheen.nix-ide"
      "vscodevim.vim"
      "mhutchie.git-graph"
    ];
    userSettings = {
      "editor.formatOnSave" = true;
    };
  };
}
