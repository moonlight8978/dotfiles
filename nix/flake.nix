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
  let
    linuxSystems = [ "x86_64-linux" ];
    darwinSystems = [ "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs (linuxSystems ++ darwinSystems) f;
    devShell = system: let pkgs = nixpkgs.legacyPackages.${system}; in {
      default = with pkgs; mkShell {
        nativeBuildInputs = with pkgs; [ git ];

        shellHook = with pkgs; ''
          export EDITOR=nvim
        '';
      };
    };
  in
  {
    devShells = forAllSystems devShell;

    homeConfigurations = import ./hosts/debian rec {
      inherit home-manager;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };
    };

    darwinConfigurations."IBM-5100-mini-5" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
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

    darwinConfigurations."May-tinh-Casio-13-M1-9" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
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
