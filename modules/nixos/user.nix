{ config, lib, pkgs, inputs, ... }:

with lib;
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];


  options = {
    woelfchen.user = {
      username = mkOption {
        type = types.strMatching "[a-z]+";
      };
    };

  };


  config = {
    users.users.${config.woelfchen.user.username} = {
      isNormalUser = true;
      extraGroups = mkMerge [
        [ "wheel" "networkmanager" ]
        (mkIf config.woelfchen.scanning.enable
          [ "scanner" "lp" ]
        )
        (mkIf config.woelfchen.virtualbox.enable [
          "vboxusers"
        ])
      ];
    };

    home-manager = {
      extraSpecialArgs = { inherit inputs pkgs; };
      useUserPackages = true;
      useGlobalPkgs = true;
      users = {
        "${config.woelfchen.user.username}" = {
          home.username = config.woelfchen.user.username;
          home.homeDirectory = "/home/${config.woelfchen.user.username}";
          programs.home-manager.enable = true;
          home.stateVersion = "23.11"; # which version the home-manager config is compatible with
          imports = [
            ../home-modules.nix
            ../../users/${config.woelfchen.user.username}.nix
          ];

        };
      };
    };
  };

}
