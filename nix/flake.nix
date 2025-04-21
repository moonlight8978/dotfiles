{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  {
    homeConfigurations."moonlight" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [ ./home-debian.nix ./fonts.nix ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."IBM-5100-mini-5" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs { system = "aarch64-darwin"; };
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";

            users.users.moonlight = {
              name = "moonlight";
              home = "/Users/moonlight";
            };

            home-manager.users.moonlight = ./home-darwin.nix;
          }
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
