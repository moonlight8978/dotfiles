{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    # Homebrew taps
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-moonlight = {
      url = "github:moonlight8978/homebrew-tap";
      flake = false;
    };
    homebrew-laio = {
      url = "github:ck3mp3r/laio-cli";
      flake = false;
    };
    homebrew-services = {
      url = "github:homebrew/homebrew-services";
      flake = false;
    };
    homebrew-hashicorp = {
      url = "github:hashicorp/homebrew-tap";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, ... }:
  {
    homeConfigurations."moonlight" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [ ./hosts/debian ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."IBM-5100-mini-5" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };
      modules = [
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
        ./hosts/darwin
      ];
      specialArgs = inputs;
    };
  };
}
