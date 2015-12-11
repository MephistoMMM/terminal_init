#!/bin/bash
#
# The script init vim!
# I install vim from source for I need more powerful vim
#  
# CreateDate: 2015/11/30
# ChangeDate: 2015/11/30
# Author Mephis Pheies
# Email mephistommm@gmail.com

# import package manager function
source $GENPATH/lib/package.sh

VIM_PATH=$GENPATH/tmp/vim
if [ ! -e $VIM_PATH ]; then
    mkdir $VIM_PATH
fi

# vim and vimrc and vundle
VIM_TAR=v7.4.900.tar.gz
VIM_SRC_PATH=vim-7.4.900

remove_packages 1 vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
install_packages libncurses5-dev liblua5.1-dev luajit libluajit-5.1 

wget -O $VIM_PATH/$VIM_TAR https://github.com/vim/vim/archive/$VIM_TAR \
    && tar -xzv -f $VIM_PATH/$VIM_TAR -C $VIM_PATH\
    && cd $VIM_PATH/$VIM_SRC_PATH && ./configure \
        --with-features=huge \
        --enable-rubyinterp \
        --enable-cscope \
        --enable-python3interp \
        --enable-pythoninterp \
        --enable-luainterp \
        --with-luajit \
    && make \
    && make install 

test -e $INIT_HOME/.vim && rm -rf $INIT_HOME/.vim
mkdir $INIT_HOME/.vim\
    && cp $GENPATH/src/vimrc $INIT_HOME/.vim/vimrc \
    && git clone https://github.com/VundleVim/Vundle.vim.git $INIT_HOME/.vim/bundle/Vundle.vim \
    && git clone https://github.com/MephistoMMM/molokai.git  $INIT_HOME/.vim/bundle/molokai \
    && chown -R $INIT_USER:$INIT_USER $INIT_HOME/.vim \
    && vim +source$INIT_HOME/.vim/vimrc +PluginInstall +qall

rm -rf $VIM_PATH
