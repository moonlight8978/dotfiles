# Binary
export PATH="$PATH:/usr/local/bin"

# https://github.com/agkozak/zcomet?tab=readme-ov-file#sample-zshrc
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

if [[ ! -f ${HOME}/.tmux/plugins/tpm/tpm ]]; then
  command git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load ohmyzsh

zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/kubectl
zcomet load ohmyzsh plugins/helm
zcomet load ohmyzsh plugins/direnv
zcomet load ohmyzsh plugins/docker-compose
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/golang

export PYTHON_AUTO_VRUN=true
zcomet load ohmyzsh plugins/python

# Auto completion
zcomet load zsh-users/zsh-completions
zcomet load agkozak/zsh-z
zcomet load zsh-users/zsh-autosuggestions

zcomet compinit
autoload -U +X bashcompinit && bashcompinit

# History
setopt hist_find_no_dups hist_reduce_blanks

# cd without typing cd
#setopt auto_cd

# Themes
zcomet load zsh-users/zsh-syntax-highlighting

# Ctrl+W delete word by word
autoload -U select-word-style
select-word-style bash

# Load .zshrc.d/*.zsh and .zshrc.d/{darwin,linux}/*.zsh
# Files are sourced in lexical order of their basename, so the numeric
# prefix controls priority across both the parent and OS-specific folder
# (e.g. 000_prompt.zsh > darwin/001_prompt.zsh > 002_tool.zsh).
ZSHRC_D="${ZDOTDIR:-$HOME}/.zshrc.d"
case "$(uname)" in
  Darwin) os_dir="darwin" ;;
  Linux)  os_dir="linux" ;;
esac

setopt nullglob
zshrc_d_files=($ZSHRC_D/*.zsh)
if [[ -n "$os_dir" && -d "$ZSHRC_D/$os_dir" ]]; then
  zshrc_d_files+=($ZSHRC_D/$os_dir/*.zsh)
fi
unsetopt nullglob

zshrc_d_pairs=()
for file in $zshrc_d_files; do
  zshrc_d_pairs+=("${file:t}|$file")
done
for pair in ${(o)zshrc_d_pairs}; do
  source ${pair#*|}
done
unset zshrc_d_files zshrc_d_pairs pair file os_dir

# Source ~/.env if it exists
if [ -f $HOME/.env ]; then
  source $HOME/.env
fi

# Load Alias
if [[ ! -e $HOME/.alias ]]; then
  mkdir -p $HOME/.alias
fi

setopt nullglob # Prevent errors if no files are found
for file in ~/.alias/*; do
  source $file
done
unsetopt nullglob
