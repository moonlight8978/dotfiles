{
  pkgs,
  lib,
  self,
  home-manager,
  laio,
  ...
}: {
  imports = [
    ./home-manager.nix
    ./homebrew.nix
    ./dock.nix
  ];

  environment.systemPackages = with pkgs;
    [
      vim
    ]
    ++ (import ../../modules/packages.nix {
      inherit pkgs laio;
      system = "aarch64-darwin";
    });

  nix = {
    enable = false;
  };

  system = {
    # Set Git commit hash for darwin-version.
    # configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };
}
