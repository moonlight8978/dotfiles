# ref: https://github.com/dustinlyons/nixos-config/blob/main/modules/shared/packages.nix
inputs @ {
  pkgs,
  laio,
  system,
}:
with pkgs; [
  # General purpose
  git
  wget
  curl
  neofetch
  btop
  zip
  fzf
  just
  jq
  yq-go
  stow
  tmux
  ripgrep
  neovim
  direnv
  gettext
  openssl
  pre-commit

  # Cloud, Devtools
  awscli2
  cri-tools
  k9s
  kubectl
  gh
  helmfile
  sops
  kubernetes-helm
  kustomize
  docker-compose
  foreman
  ngrok
  argocd
  laio.packages.${system}.default
  s3cmd
  minio-client
  # vagrant
  yamlfmt
  rclone

  # Encryption and security tools
  gnupg
  wireguard-tools
  duplicity
  wgcf
  cfssl
  mkpasswd

  # Compressions
  zip
  unzip
  unrar
]
