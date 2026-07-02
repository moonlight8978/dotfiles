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
      "homebrew/homebrew-services" = inputs.homebrew-services;
      "moonlight8978/homebrew-tap" = inputs.homebrew-moonlight;
      "hashicorp/homebrew-tap" = inputs.homebrew-hashicorp;
      "mongodb/homebrew-brew" = inputs.homebrew-mongodb;
      "telepresenceio/homebrew-telepresence" = inputs.homebrew-telepresence;
      "k0sproject/homebrew-tap" = inputs.homebrew-k0s;
      "auth0/homebrew-auth0-cli" = inputs.homebrew-auth0;
      "messense/homebrew-macos-cross-toolchains" = inputs.homebrew-macos-cross-toolchains;
      "anomalyco/homebrew-tap" = inputs.homebrew-anomalyco;
    };
    mutableTaps = false;

    trust = {
      taps = [
        "moonlight8978/homebrew-tap"
        "hashicorp/homebrew-tap"
        "mongodb/homebrew-brew"
        "telepresenceio/homebrew-telepresence"
        "k0sproject/homebrew-tap"
        "auth0/homebrew-auth0-cli"
        "messense/homebrew-macos-cross-toolchains"
        "anomalyco/homebrew-tap"
      ];
    };
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
      # "postman"
      # "bruno"
      "medis"
      "tablepro"
      # "figma"
      "visual-studio-code"
      # "cursor"
      # "cursor-cli"
      "zed"
      "orbstack"
      # "clickhouse"
      "yaak"
      "claude-code"
      "gcloud-cli"
      "antigravity"
      # "codex"
      # "codex-app"

      # General purpose
      "google-chrome"
      # "firefox"
      "microsoft-edge"
      "openkey"
      # "bluestacks-air"
      # "balenaetcher"
      "telegram"
      # "mark-text"
      # "syncthing-app"
      # "lobehub"

      # VPN, Remote
      # "openvpn-connect"
      # "rustdesk"
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
      # "mas"
      "bitwarden-cli"
      "bitwarden-sm-cli"

      # Dev tools
      "lazygit"
      "zsh"
      # "pdm"
      "libpq"
      "act"
      "hashicorp/tap/vault"
      "ansible"
      "goreleaser"
      "go-task"
      # "velero"
      # "telepresenceio/telepresence/telepresence-oss"
      "ggshield"
      "lima"
      # "lima-additional-guestagents"
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
      "dnsmasq"

      # Toolchains
      # "messense/macos-cross-toolchains/x86_64-unknown-linux-gnu"
      # "messense/macos-cross-toolchains/aarch64-unknown-linux-gnu"

      # AI CLIs
      # "gemini-cli"
      # "anomalyco/tap/opencode"
      # "copilot-cli"
      "repomix"
      "beads"
      "rtk"

      # Container tools
      # "podman"
      # "podman-compose"
      # "docker"
      # "docker-compose"

      # Security
      "age"
      "trivy"
      "trufflehog"
      "dive"
    ];
  };
}
