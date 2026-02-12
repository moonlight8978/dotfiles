{
  description = "Homebrew configuration";

  inputs = {
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-moonlight = {
      url = "github:moonlight8978/homebrew-tap";
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
    homebrew-mongodb = {
      url = "github:mongodb/homebrew-brew";
      flake = false;
    };
    homebrew-telepresence = {
      url = "github:telepresenceio/homebrew-telepresence";
      flake = false;
    };
    homebrew-k0s = {
      url = "github:k0sproject/homebrew-tap";
      flake = false;
    };
    homebrew-auth0 = {
      url = "github:auth0/homebrew-auth0-cli";
      flake = false;
    };
    homebrew-macos-cross-toolchains = {
      url = "github:messense/macos-cross-toolchains";
      flake = false;
    };
  };

  outputs = inputs: {
    modules = [
      inputs.nix-homebrew.darwinModules.nix-homebrew
    ];

    config = ({config,...}: import ./homebrew.nix { inherit config inputs; });
  };
}
