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
    ];
  };
}