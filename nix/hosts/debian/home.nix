{ config, pkgs, ... }:

{
  home = {
    stateVersion = "24.11";
    
    username = "moonlight";
    homeDirectory = "/home/moonlight";

    packages = with pkgs; [
      google-chrome
      vscode
      vim
    ] ++ (import ../../modules/packages.nix { inherit pkgs; }) ++ (import ../../modules/fonts.nix { inherit pkgs; });

    file = {};
  };

  programs.home-manager.enable = true;
}
