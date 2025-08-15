{
  homebrew-core,
  homebrew-cask,
  homebrew-moonlight,
  homebrew-services,
  homebrew-hashicorp,
  homebrew-youtube-music,
  config,
  homebrew-bundle,
  homebrew-mongodb,
  homebrew-telepresence,
  ...
}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "moonlight";
    autoMigrate = true;

    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
      "moonlight8978/homebrew-tap" = homebrew-moonlight;
      "homebrew/homebrew-services" = homebrew-services;
      "hashicorp/homebrew-tap" = homebrew-hashicorp;
      "th-ch/homebrew-youtube-music" = homebrew-youtube-music;
      "mongodb/homebrew-brew" = homebrew-mongodb;
      "telepresenceio/homebrew-telepresence" = homebrew-telepresence;
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

    taps = builtins.attrNames config.nix-homebrew.taps;

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
      # "podman-desktop"
      "orbstack"
      "dbeaver-community"
      "lens"
      "clickhouse"

      # General purpose
      "google-chrome"
      "opera"
      "firefox"
      "joplin"
      "openkey"
      "bluestacks-air"
      "balenaetcher"
      "youtube-music"
      "wpsoffice"
      "discord"
      "telegram"

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
      "hashicorp/tap/vault"
      "ansible"
      "k3sup"
      "goreleaser"
      "go-task"
      "mongodb-database-tools"
      "velero"
      "telepresenceio/telepresence/telepresence-oss"

      # Container tools
      # "podman"
      # "podman-compose"
      # "docker"
      # "docker-compose"

      # Security
      "age"
    ];
  };
}
