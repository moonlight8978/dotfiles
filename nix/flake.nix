{
  description = "_MoonLight_ nix configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    laio = {
      url = "github:ck3mp3r/laio-cli";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nix-darwin, ... }: let
    # TODO: Extract to github repo and auto bump deps
    homebrew = builtins.getFlake "/Users/moonlight/Workspace/moonlight8978/dotfiles/nix/modules/homebrew";

    mkNixpkgs = system: import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  in {
    darwinConfigurations."AZmb-M4" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      pkgs = mkNixpkgs system;
      modules = homebrew.modules ++ [
        home-manager.darwinModules.home-manager
        ./hosts/darwin
      ];
      specialArgs = inputs;
    };

    darwinConfigurations."IBM-5100-mini" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      pkgs = mkNixpkgs system;
      modules = homebrew.modules ++ [
        home-manager.darwinModules.home-manager
        ./hosts/darwin
      ];
      specialArgs = inputs;
    };

    darwinConfigurations."May-tinh-Casio-13-M1" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      pkgs = mkNixpkgs system;
      modules = homebrew.modules ++ [
        home-manager.darwinModules.home-manager
        ./hosts/darwin
      ];
      specialArgs = inputs;
    };
  };
}
