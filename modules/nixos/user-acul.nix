{ inputs, config, pkgs, ... }:

{

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  fonts.packages = with pkgs; [
    roboto
  ];


  environment.systemPackages = with pkgs; [
    tree
    spotify
    nixpkgs-fmt
    rustup
    gcc
    typst
    gnome.simple-scan
    pdfarranger
  ];

  users.users.acul = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "scanner" "lp" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    useUserPackages = true;
    useGlobalPkgs = true;
    users = {
      "acul" = import ../../home/acul/home.nix;
    };
  };
}
