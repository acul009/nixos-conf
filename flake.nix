{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.acul-Battlestation= nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
            ./modules/nixos/user-acul.nix
            ./modules/nixos/localization.nix
            ./modules/nixos/flatpak.nix
            ./modules/nixos/nvidia.nix
            ./modules/nixos/pipewire.nix
            inputs.home-manager.nixosModules.default
          ];
        };

    };
}