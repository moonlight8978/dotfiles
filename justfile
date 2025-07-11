set shell := ["bash", "-cu"]

default: all

prepare:
  sed "s|\$HOME|${HOME}|g" inventory.example.ini > inventory.ini

all: zsh tmux asdf nvim ghostty tldr

zsh:
  stow -t ~ zsh

tmux:
  stow -t ~ tmux

asdf:
  stow -t ~ asdf

nvim:
  mkdir -p ~/.config/nvim
  stow -t ~/.config/nvim nvim

kitty:
  mkdir -p ~/.config/kitty
  stow -t ~/.config/kitty kitty

ghostty:
  mkdir -p ~/.config/ghostty
  stow -t ~/.config/ghostty ghostty

tldr:
  stow -t ~ tldr

nix:
  mkdir -p ~/.config/home-manager
  stow -t ~/.config/home-manager nix

nix-darwin:
  sudo mkdir -p /etc/nix-darwin
  sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
  stow -t /etc/nix-darwin nix
