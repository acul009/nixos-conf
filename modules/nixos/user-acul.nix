{ inputs, config, pkgs, ... }:

{

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.acul = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
      yakuake
      vscodium
      spotify
      nixpkgs-fmt
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "acul" = import ../../home/acul/home.nix;
    };
  };
}
