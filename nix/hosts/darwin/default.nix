inputs@{
  pkgs,
  ...
}: {
  imports = [
    ./dock.nix
    ./settings.nix
    ./hotkeys.nix
  ];

  users.users.moonlight = {
    name = "moonlight";
    home = "/Users/moonlight";
  };

  system.primaryUser = "moonlight";

  environment.systemPackages = with pkgs;
    [
      vim
    ]
    ++ (import ../../modules/packages.nix {
      inherit pkgs inputs;
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
