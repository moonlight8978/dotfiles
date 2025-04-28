{ homebrew-core, homebrew-cask, homebrew-moonlight, homebrew-laio, homebrew-services, homebrew-hashicorp, homebrew-youtube-music, ... }:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "moonlight";
    autoMigrate = true;

    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "moonlight8978/tap" = homebrew-moonlight;
      "ck3mp3r/laio-cli" = homebrew-laio;
      "homebrew/homebrew-services" = homebrew-services;
      "hashicorp/tap" = homebrew-hashicorp;
      "th-ch/youtube-music" = homebrew-youtube-music;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
    };

    casks = [
      "google-chrome"
      "ghostty"
      "postman"
      "bruno"
      "medis"
      "tableplus"
      "openvpn-connect"
      "figma"
      "joplin"
      "anydesk"
      "evkey"
      "bluestacks-air"
      "cloudflare-warp"
      "visual-studio-code"
      "balenaetcher"
      "cursor"
      "podman-desktop"
      "youtube-music"
    ];

    brews = [
      # General purpose
      "libyaml"
      "coreutils"
      "smartmontools"
      "mas"

      # Dev tools
      "lazygit"
      "terragrunt"
      "terraform"
      "asdf"
      "zsh"

      # Container tools
      "podman"
      "podman-compose"
      "docker"
      "docker-compose"
    ];
  };
}
