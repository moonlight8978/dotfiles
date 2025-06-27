# nvim as default editor
export EDITOR=nvim

# https://github.com/agkozak/zcomet?tab=readme-ov-file#sample-zshrc
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
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

if [[ ! ":$PATH:" == *":asdf:"* ]]; then
  zcomet load ohmyzsh plugins/asdf
fi

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
zcomet load romkatv/powerlevel10k powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Binary
# export PATH="$PATH:/usr/local/bin"

# terraform
complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt

# Ctrl+W delete word by word
autoload -U select-word-style
select-word-style bash

# fzf
source <(fzf --zsh)

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
