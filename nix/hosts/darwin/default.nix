{ pkgs, lib, self, home-manager, ... }:
{
  imports = [
    ./home-manager.nix
    ./homebrew.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
  ] ++ (import ../../modules/packages.nix { inherit pkgs; });

  nix = {
    enable = false;
  };

  # Set Git commit hash for darwin-version.
  system = {
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
  };
}
