#/bin/bash

apt-get update
apt-get install -y git zsh vim 


#vim and vimrc and vundle
mkdir ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./src/vimrc ~/.vim/vimrc
vim +source~/.vim/vimrc +PluginInstall +qall


#zsh and oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ./src/zshrc ~/.zshrc
chsh -s /bin/zsh
/bin/zsh

