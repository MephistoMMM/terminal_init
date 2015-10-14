#/bin/bash

apt-get update
apt-get install git , zsh , vim 

#zsh and oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.default
cp ./src/zshrc ~/.zshrc

#vim and vimrc and vundle
mkdir ~/.vim
cp ./src/vimrc ~/.vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim source ~/.vim/vimrc
vim PluginInstall 



