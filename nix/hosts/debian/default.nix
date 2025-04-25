{ pkgs, lib, ... }:

{
  home = {
    stateVersion = "24.11";

    username = "moonlight";
    homeDirectory = "/home/moonlight";

    packages = with pkgs; [
      vim
    ] ++ (import ../../modules/packages.nix { inherit pkgs; }) ++ (import ../../modules/fonts.nix { inherit pkgs; });

    file = {};
  };

  services = {
    flatpak = {
      enable = true;

      remotes = lib.mkOptionDefault [{
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }];

      packages = [
        "com.google.Chrome"
        "com.visualstudio.code"
        "io.podman_desktop.PodmanDesktop"
      ];
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
