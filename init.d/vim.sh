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
VIM_TAR=v7.4.1815.tar.gz
VIM_SRC_PATH=vim-7.4.1815

remove_packages 1 vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
install_packages libncurses5-dev liblua5.1-dev libluajit-5.1 
install_packages luajit
install_packages gcc make

wget -O $VIM_PATH/$VIM_TAR https://github.com/vim/vim/archive/$VIM_TAR \
    && tar -xzv -f $VIM_PATH/$VIM_TAR -C $VIM_PATH\
    && cd $VIM_PATH/$VIM_SRC_PATH && ./configure \
        --with-features=huge \
        --enable-rubyinterp \
        --enable-cscope \
        --enable-python3interp \
        --enable-luainterp \
        --with-lua-prefix=/usr \
        --with-luajit \
    && make \
    && make install 

if [ $IS_ARCHLINUX == "1" ] ; then 
    install_packages python-pylint ctags cscope
else
    install_packages pylint exuberant-ctags cscope
fi

test -e $INIT_HOME/.vim && rm -rf $INIT_HOME/.vim
mkdir $INIT_HOME/.vim 
cp $GENPATH/src/vimrc $INIT_HOME/.vim/vimrc 
git clone https://github.com/VundleVim/Vundle.vim.git $INIT_HOME/.vim/bundle/Vundle.vim 

# for my color
git clone https://github.com/MephistoMMM/gruvbox.git  $INIT_HOME/.vim/bundle/gruvbox 

#for undotree and nerdtree
mkdir $INIT_HOME/.vim/undodir 
touch $INIT_HOME/.vim/.NERDTreeBookmarks 

#for ultisnips
git clone https://github.com/MephistoMMM/USlibrary.git $INIT_HOME/.vim/UltiSnips

#change mod
vim +source$INIT_HOME/.vim/vimrc +PluginInstall +qall
chown -R $INIT_USER:$INIT_USER $INIT_HOME/.vim 

rm -rf $VIM_PATH

echo "If you want to support js syntastic, you should install eslint_d"
echo "  sudo npm install -g eslint_d"

