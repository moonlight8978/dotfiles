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
ZSHRC_D="${ZDOTDIR:-$HOME}/.zshrc.d"
setopt nullglob
for file in $ZSHRC_D/*.zsh; do source $file; done

case "$(uname)" in
  Darwin) os_dir="darwin" ;;
  Linux)  os_dir="linux" ;;
esac
if [[ -n "$os_dir" && -d "$ZSHRC_D/$os_dir" ]]; then
  for file in $ZSHRC_D/$os_dir/*.zsh; do source $file; done
fi
unsetopt nullglob

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
