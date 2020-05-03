# Install basic packages
sudo apt install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# Install and config tmux
rm -rf ~/.tmux
rm ~/.tmux.conf
sudo apt install tmux -y

# ## Install TPM and packages
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ~/.tmux.conf
tmux new-session -d
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh

Install vim
rm -rf ~/.vim
rm ~/.vimrc
sudo apt install vim -y

## Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~/.vimrc
vim +PlugInstall +qall
echo "Open vim then use :source ~/.vimrc"

# Install git
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install git

# Install zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
