# ref: https://github.com/dustinlyons/nixos-config/blob/main/modules/shared/packages.nix
{ pkgs }:
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
  yq
  stow
  tmux
  ripgrep
  neovim
  direnv
  gettext
  openssl

  # Cloud, Devtools
  awscli2
  cri-tools
  kubectl
  gh
  helmfile
  sops
  kubernetes-helm
  foreman
  ngrok
  argocd
  # ansible

  # Encryption and security tools
  gnupg
  wireguard-tools
  duplicity

  # Compressions
  zip
  unzip
  unrar
]
