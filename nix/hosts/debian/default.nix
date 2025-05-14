{ pkgs, lib, laio, ... }:

{
  home = {
    stateVersion = "24.11";

    username = "moonlight";
    homeDirectory = "/home/moonlight";

    packages = with pkgs; [
      vim
      vscode
      asdf-vm
    ] ++ (import ../../modules/packages.nix { inherit pkgs laio; system = "x86_64-linux"; }) ++ (import ../../modules/fonts.nix { inherit pkgs; });

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
        "io.podman_desktop.PodmanDesktop"
      ];

      overrides = {
        "com.visualstudio.code".Context = {
          filesystems = [
            "xdg-config/git:ro"
            "/home/moonlight/.nix-profile/bin:ro"
            "/home/moonlight/.nix-profile/sbin:ro"
          ];
        };

      };
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
