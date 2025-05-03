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
