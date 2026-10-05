{
  description = "Homebrew configuration";

  inputs = {
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew/09a921d0181146cf6163ec2cc1db7b6fd539a885";
      inputs.brew-src.follows = "brew-src";
    };

    brew-src = {
      url = "github:Homebrew/brew/6.0.18";
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
    homebrew-anomalyco = {
      url = "github:anomalyco/homebrew-tap";
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
