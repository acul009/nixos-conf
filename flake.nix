{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    eww = {
      url = "github:elkowar/eww";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      hosts = [
        "acul-Kommandozentrale"
        ];
    in
    {

      nixosConfigurations = genAttrs hosts (name: {
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/module-list.nix
          ./hosts/${name}.nix
        ]
      });

      nixosConfigurations.acul-Battlestation = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./modules/legacy/boot.nix
          ./modules/legacy/cli-tools.nix
          ./modules/legacy/user-acul.nix
          ./modules/legacy/localization.nix
          ./modules/legacy/plasma.nix
          ./modules/legacy/hyprland.nix
          ./modules/legacy/printing.nix
          ./modules/legacy/flatpak.nix
          ./modules/legacy/nvidia.nix
          ./modules/legacy/pipewire.nix
          ./modules/legacy/zsh.nix
          ./modules/legacy/overrides.nix
          ./modules/legacy/steam.nix
          ./modules/legacy/teamviewer.nix
          ./modules/legacy/partition-manager.nix
        ];
      };



    };
}
