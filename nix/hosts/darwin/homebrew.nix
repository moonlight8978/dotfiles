{
  homebrew-core,
  homebrew-cask,
  homebrew-moonlight,
  homebrew-services,
  homebrew-hashicorp,
  config,
  homebrew-bundle,
  homebrew-mongodb,
  homebrew-telepresence,
  homebrew-k0s,
  homebrew-auth0,
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
      "mongodb/homebrew-brew" = homebrew-mongodb;
      "telepresenceio/homebrew-telepresence" = homebrew-telepresence;
      "k0sproject/homebrew-tap" = homebrew-k0s;
      "auth0/homebrew-auth0-cli" = homebrew-auth0;
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
      "cursor-cli"
      "zed"
      "orbstack"
      "clickhouse"
      "yaak"
      "claude-code"
      "gcloud-cli"
      "antigravity"

      # General purpose
      "google-chrome"
      "firefox"
      "microsoft-edge"
      "openkey"
      "bluestacks-air"
      "balenaetcher"
      "telegram"
      "mark-text"
      "syncthing-app"
      "lobehub"

      # VPN, Remote
      "openvpn-connect"
      "rustdesk"
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
      "bitwarden-cli"
      "bitwarden-sm-cli"

      # Dev tools
      "lazygit"
      "terragrunt"
      "terraform"
      "zsh"
      "pdm"
      "libpq"
      "act"
      "hashicorp/tap/vault"
      "ansible"
      "goreleaser"
      "go-task"
      "velero"
      "telepresenceio/telepresence/telepresence-oss"
      "ggshield"
      "k3sup"
      "kubernetes-schema-store"
      "k0sctl"
      "krew"
      "minikube"
      "cloudflared"
      "iproute2mac"
      "gemini-cli"
      "devcontainer"
      "auth0/auth0-cli/auth0"
      "cloud-sql-proxy"

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
