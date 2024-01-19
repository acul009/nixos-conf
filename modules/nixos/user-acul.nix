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
      vscodium
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
