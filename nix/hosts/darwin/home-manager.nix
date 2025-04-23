{ config, pkgs, ... }:
{
  users.users.moonlight = {
    name = "moonlight";
    home = "/Users/moonlight";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";

    users.moonlight = {
      home = {
        stateVersion = "24.11";

        packages = [
          pkgs.home-manager
        ] ++ (import ../../modules/fonts.nix { inherit pkgs; });

        sessionVariables = {
          EDITOR = "nvim";
        };
      };

      programs.home-manager.enable = true;
    };

  };
}
