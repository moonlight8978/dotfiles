# nvim as default editor
export EDITOR=nvim

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

# starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Powerlevel10k prompt
# zcomet load romkatv/powerlevel10k powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Binary
# export PATH="$PATH:/usr/local/bin"

# terraform
complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt

# Ctrl+W delete word by word
autoload -U select-word-style
select-word-style bash

# fzf
# source <(fzf --zsh)

# atuin
eval "$(atuin init zsh)"

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

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
else
  echo "warning: mise not found"
fi

export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
