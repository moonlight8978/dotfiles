# nvim as default editor
export EDITOR=nvim

# https://github.com/agkozak/zcomet?tab=readme-ov-file#sample-zshrc
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load ohmyzsh

# Alias
zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/git
zcomet load ohmyzsh plugins/docker
zcomet load ohmyzsh plugins/docker-compose
alias dco="docker compose"
zcomet load ohmyzsh plugins/kubectl
zcomet load ohmyzsh plugins/helm

# Auto completion
zcomet load zsh-users/zsh-completions
zcomet load agkozak/zsh-z
zcomet load zsh-users/zsh-autosuggestions

zcomet compinit
autoload -U +X bashcompinit && bashcompinit

# History
setopt hist_find_no_dups hist_reduce_blanks

# cd without typing cd
setopt auto_cd

# Themes
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load romkatv/powerlevel10k powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Binary
export PATH="/usr/local/bin:$PATH"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1

# pnpm
export PNPM_HOME="/Users/moonlight/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# sql
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# terraform
complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt

# Ctrl+W delete word by word
autoload -U select-word-style
select-word-style bash

# fzf
source <(fzf --zsh)

# Source ~/.env if it exists
if [ -f ~/.env ]; then
  source ~/.env
fi
