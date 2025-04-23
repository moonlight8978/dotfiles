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
  ngrok
  tmux
  ripgrep
  neovim

  # Cloud
  awscli2
  cri-tools
  kubectl
  gh
  helmfile
  sops
  kubernetes-helm

  # Encryption and security tools
  gnupg
  wireguard-tools
  duplicity

  # Compressions
  zip
  unzip
  unrar
]
