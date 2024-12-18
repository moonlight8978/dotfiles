set shell := ["bash", "-cu"]

default: all

all: tmux nvim 

tmux:
  stow -t ~ tmux

nvim:
  mkdir -p ~/.config/nvim
  stow -t ~/.config/nvim nvim
  
