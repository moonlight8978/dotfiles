set shell := ["bash", "-cu"]

default: run

run:
  stow -t ~ zsh
  mkdir -p ~/.config/nvim
  stow -t ~/.config/nvim nvim
