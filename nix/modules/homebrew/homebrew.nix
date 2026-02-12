{
  inputs,
  config,
  ...
}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "moonlight";
    autoMigrate = true;

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "moonlight8978/homebrew-tap" = inputs.homebrew-moonlight;
      "homebrew/homebrew-services" = inputs.homebrew-services;
      "hashicorp/homebrew-tap" = inputs.homebrew-hashicorp;
      "mongodb/homebrew-brew" = inputs.homebrew-mongodb;
      "telepresenceio/homebrew-telepresence" = inputs.homebrew-telepresence;
      "k0sproject/homebrew-tap" = inputs.homebrew-k0s;
      "auth0/homebrew-auth0-cli" = inputs.homebrew-auth0;
      "messense/homebrew-macos-cross-toolchains" = inputs.homebrew-macos-cross-toolchains;
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
      "devcontainer"
      "auth0/auth0-cli/auth0"
      "cloud-sql-proxy"

      # Toolchains
      "messense/macos-cross-toolchains/x86_64-unknown-linux-gnu"
      "messense/macos-cross-toolchains/aarch64-unknown-linux-gnu"

      # AI CLIs
      "gemini-cli"
      "opencode"
      "copilot-cli"

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
