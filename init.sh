#/bin/bash

apt-get update
apt-get install -y git zsh vim 


#vim and vimrc and vundle
mkdir ~/.vim\
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && cp ./src/vimrc ~/.vim/vimrc \
    && vim +source~/.vim/vimrc +PluginInstall +qall


#zsh and oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh\
    && cp ./src/zshrc ~/.zshrc\
    && chsh -s /bin/zsh

# install python3
# install python-pip and python3-pip
apt-get install python3 \
    && apt-get install -y python-pip python3-pip

# install w3m
apt-get install -y w3m

#add powerline font
git clone https://github.com/powerline/fonts.git ./src/ \
    && ./src/fonts/install.sh


