set shell := ["bash", "-cu"]

default: run

run:
  stow -t ~ zsh tmux
  mkdir -p ~/.config/nvim
  stow -t ~/.config/nvim nvim
