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
  };

  # outputs = inputs @ {
  #   self,
  #   nix-darwin,
  #   nixpkgs,
  #   home-manager,
  #   nix-homebrew,
  #   nix-flatpak,
  #   ...
  # }: let
  #   linuxSystems = ["x86_64-linux"];
  #   darwinSystems = ["aarch64-darwin"];
  #   forAllSystems = f: nixpkgs.lib.genAttrs (linuxSystems ++ darwinSystems) f;
  #   devShell = system: let
  #     pkgs = nixpkgs.legacyPackages.${system};
  #   in {
  #     default = with pkgs;
  #       mkShell {
  #         nativeBuildInputs = with pkgs; [git];

  #         shellHook = with pkgs; ''
  #           export EDITOR=nvim
  #         '';
  #       };
  #   };
  # in {
  #   devShells = forAllSystems devShell;

  #   homeConfigurations."moonlight" = home-manager.lib.homeManagerConfiguration rec {
  #     pkgs = import nixpkgs {
  #       system = "x86_64-linux";
  #       config = {
  #         allowUnfree = true;
  #         allowUnfreePredicate = _: true;
  #       };
  #     };
  #     modules = [
  #       nix-flatpak.homeManagerModules.nix-flatpak
  #       ./hosts/debian
  #     ];
  #     extraSpecialArgs = inputs;
  #   };

  #   darwinConfigurations."IBM-5100-mini" = nix-darwin.lib.darwinSystem rec {
  #     system = "aarch64-darwin";
  #     pkgs = import nixpkgs {
  #       inherit system;
  #       config = {
  #         allowUnfree = true;
  #         allowUnfreePredicate = _: true;
  #       };
  #     };
  #     modules = [
  #       home-manager.darwinModules.home-manager
  #       nix-homebrew.darwinModules.nix-homebrew
  #       ./hosts/darwin
  #     ];
  #     specialArgs = inputs;
  #   };

  #   darwinConfigurations."May-tinh-Casio-13-M1" = nix-darwin.lib.darwinSystem rec {
  #     system = "aarch64-darwin";
  #     pkgs = import nixpkgs {
  #       inherit system;
  #       config = {
  #         allowUnfree = true;
  #         allowUnfreePredicate = _: true;
  #       };
  #     };
  #     modules = [
  #       home-manager.darwinModules.home-manager
  #       nix-homebrew.darwinModules.nix-homebrew
  #       ./hosts/darwin
  #     ];
  #     specialArgs = inputs;
  #   };
  # };
}
