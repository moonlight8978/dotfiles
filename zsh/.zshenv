# . "$HOME/.cargo/env"

platform=$(uname)
if [[ $platform == "Linux" ]]; then
  export TERM=xterm-256color
fi
