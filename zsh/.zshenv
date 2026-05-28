typeset -U path PATH

case "$OSTYPE" in
  darwin*) OS_NAME="darwin" ;;
  linux*)  OS_NAME="linux" ;;
esac

ZSHENV_D="${ZDOTDIR:-$HOME}/.zshenv.d"
for file in $ZSHENV_D/*.zsh(N) $ZSHENV_D/$OS_NAME/*.zsh(N); do
  source $file
done
