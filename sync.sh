#!/bin/bash

cp ./src/zshrc.linux ~/.zshrc
cp ./src/vimrc ~/.vim/vimrc \
    && vim +source~/.vim/vimrc +PluginInstall +qall
