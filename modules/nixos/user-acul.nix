{ inputs, config, pkgs, ... }:

{

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.acul = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
      spotify
      nixpkgs-fmt
      rustup
      gcc
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    users = {
      "acul" = import ../../home/acul/home.nix;
    };
  };
}
