#!/bin/sh
# This is a script to init a linux sys's base env
#
# Usage: 
#      init.sh {username} 
#
# Author Mephis Pheies
# Email mephistommm@gmail.com

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
[ $1 == "" ] && export INIT_USER=root || export INIT_USER=$1

#define package manager method
export PACKAGE_UPDATE="apt-get update"
export PACKAGE_INSTALL="apt-get install -y"
export PACKAGE_REMOVE="apt-get remove -y"
export PACKAGE_REMOVE_STRICT="apt-get remove --purge -y"

function change_pkg_manager_by_sys(){ 
    #other sys use other package manager

    if [ $(uname -r | grep 'ARCH') != "" ] ; then
        export PACKAGE_UPDATE="pacman -Syy --noconfirm"
        export PACKAGE_INSTALL="pacman -S --noconfirm"
        export PACKAGE_REMOVE="pacman -R --noconfirm"
        export PACKAGE_REMOVE_STRICT="pacman -Rnc --noconfirm"
    fi

}
function install_packages(){
    sh -c "$PACKAGE_INSTALL $@"
}
function remove_packages(){
    # $1 == "1" , use strict mode
    # else normal mode
    if [ $1 == "1" ]; then
        FUNC_REMOVE_PACKAGE=$PACKAGE_REMOVE_STRICT
    else
        FUNC_REMOVE_PACKAGE=$PACKAGE_REMOVE
    fi
    # delete $1
    shift 
    sh -c "$FUNC_REMOVE_PACKAGE $@"
}
function update_packages(){
    sh -c "$PACKAGE_UPDATE $@"
}
function init_vim(){
    #vim and vimrc and vundle
    VIM_TAR=v7.4.900.tar.gz
    VIM_PATH=vim-7.4.900
    remove_packages 1 vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
    install_packages libncurses5-dev liblua5.1-dev luajit libluajit-5.1 
    wget https://github.com/vim/vim/archive/$VIM_TAR \
        && tar -xzv -f ./$VIM_TAR \
        && cd ./$VIM_PATH && ./configure \
            --with-features=huge \
            --enable-rubyinterp \
            --enable-cscope \
            --enable-python3interp \
            --enable-pythoninterp \
            --enable-luainterp \
            --with-luajit \
        && make \
        && make install && cd ../
    test -e ~/.vim && -rf ~/.vim
    mkdir ~/.vim\
        && cp ./src/vimrc ~/.vim/vimrc \
        && chown -R $INIT_USER:$INIT_USER ~/.vim \
        && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
        && vim +source~/.vim/vimrc +PluginInstall +qall
}
function init_zsh(){
    #zsh and oh my zsh
    test -e ~/.oh-my-zsh && rm -rf ~/.oh-my-zsh
    test -e ~/.zshrc && rm ~/.zshrc
    #TODO change curl way to git clone
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"\
        && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting\
        && cp ./src/zshrc.linux ~/.zshrc\
        && chown $INIT_USER:$INIT_USER ~/.zshrc \
        && chsh -s /bin/zsh

}
function init_font(){
    #add powerline font
    git clone https://github.com/powerline/fonts.git ./src/powerlinefonts \
        && ./src/powerlinefonts/install.sh
}

# install base solf
change_pkg_manager_by_sys
update_packages
install_packages git zsh wget

# install python3
# install python-pip and python3-pip
install_packages python3 python-pip python3-pip

# install w3m
install_packages w3m

init_vim
init_font
init_zsh

