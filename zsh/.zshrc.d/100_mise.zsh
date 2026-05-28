if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
else
  echo "warning: mise not found"
fi
