#/bin/bash

apt-get update
apt-get install -y git zsh vim 


#vim and vimrc and vundle
mkdir ~/.vim
cp ./src/vimrc ~/.vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim source ~/.vim/vimrc
vim PluginInstall 


#zsh and oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mv ~/.zshrc ~/.zshrc.default
cp ./src/zshrc ~/.zshrc
chsh -s /bin/zsh
/bin/zsh

