{ homebrew-core, homebrew-cask, homebrew-moonlight, homebrew-services, homebrew-hashicorp, homebrew-youtube-music, ... }:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "moonlight";
    autoMigrate = true;

    taps = {
      "homebrew/core" = homebrew-core;
      "homebrew/cask" = homebrew-cask;
      "moonlight8978/tap" = homebrew-moonlight;
      "homebrew/services" = homebrew-services;
      "hashicorp/tap" = homebrew-hashicorp;
      "th-ch/youtube-music" = homebrew-youtube-music;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    casks = [
      # Development
      "ghostty"
      "postman"
      "bruno"
      "medis"
      "tableplus"
      "figma"
      "visual-studio-code"
      "cursor"
      "podman-desktop"

      # General purpose
      "google-chrome"
      "opera"
      "joplin"
      "evkey"
      "bluestacks-air"
      "balenaetcher"
      "youtube-music"

      # VPN, Remote
      "openvpn-connect"
      "anydesk"
      "cloudflare-warp"
    ];

    brews = [
      # Deps
      "libyaml"
      "coreutils"
      "libb2"
      "gettext"
      "openssl"

      # General purpose
      "smartmontools"
      "mas"

      # Dev tools
      "lazygit"
      "terragrunt"
      "terraform"
      "asdf"
      "zsh"
      "pdm"
      "libpq"
      "act"

      # Container tools
      "podman"
      # "podman-compose"
      # "docker"
      "docker-compose"

      # Security
      "age"
    ];
  };
}
