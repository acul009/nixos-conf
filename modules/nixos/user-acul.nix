{lib, config, pkgs, ...}:

{
  users.users.acul = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
      yakuake
      discord
      vscodium
      spotify
    ];
  };

  home-manager = {
    users = {
      "acul" = import ../../home/acul/home.nix;
    };
  };
}