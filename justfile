set shell := ["bash", "-cu"]

default: all

all: zsh tmux nvim ghostty tldr mise starship

zsh:
  stow -t ~ zsh

tmux:
  stow -t ~ tmux

starship:
  mkdir -p ~/.config/starship
  stow -t ~/.config/starship starship

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

mise:
  mkdir -p ~/.config/mise
  stow -t ~/.config/mise mise

nix:
  mkdir -p /etc/nix-darwin
  stow -t /etc/nix-darwin nix
