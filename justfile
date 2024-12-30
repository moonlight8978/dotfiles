set shell := ["bash", "-cu"]

default: all

all: tmux nvim kitty ghostty

tmux:
  stow -t ~ tmux

nvim:
  mkdir -p ~/.config/nvim
  stow -t ~/.config/nvim nvim

kitty:
  mkdir -p ~/.config/kitty
  stow -t ~/.config/kitty kitty

ghostty:
  mkdir -p ~/.config/ghostty
  stow -t ~/.config/ghostty ghostty
