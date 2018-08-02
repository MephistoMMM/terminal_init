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

remove_packages 1 vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

if [ $SYSTYPE == 1 ] ; then 
    install_packages neovim python-neovim xclip python-pip
    pip install jedi
    install_packages python-pylint ctags cscope
fi
if [ $SYSTYPE == 2 ] ; then 
    ./centos_python3.sh
    install_packages epel-release
    curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
    install_packages neovim pylint ctags cscope
    pip3 install jedi neovim
fi
if [ $SYSTYPE == 0 ] ; then 
    install_packages software-properties-common
    add-apt-repository ppa:neovim-ppa/unstable
    update_packages
    install_packages neovim python-dev python-pip python3-dev python3-pip
    pip3 install neovim jedi
    install_packages pylint exuberant-ctags cscope
fi

test -e $INIT_HOME/.config/nvim && rm -rf $INIT_HOME/.config/nvim
mkdir $INIT_HOME/.config/nvim

curl -fLo $INIT_HOME/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# for my color
git clone https://github.com/MephistoMMM/gruvbox.git  $INIT_HOME/.config/nvim/plugged/gruvbox 

#for ultisnips
git clone https://github.com/MephistoMMM/USlibrary.git $INIT_HOME/.config/nvim/UltiSnips

# for undo 
mkdir $INIT_HOME/.config/nvim/undodir 

chown -R $INIT_USER:$INIT_USER $INIT_HOME/.config
cp $GENPATH/src/vimrc $INIT_HOME/.config/nvim/init.vim
nvim +source$INIT_HOME/.config/nvim/init.vim +PlugInstall +qall

# copy gruvbox
if [ -d "$INIT_HOME/.oh-my-zsh" ]; then
    cp $INIT_HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh\
       $INIT_HOME/.oh-my-zsh
fi

#change mod
chown -R $INIT_USER:$INIT_USER $INIT_HOME/.config

rm -rf $VIM_PATH

echo "If you want to support js syntastic, you should install eslint_d"
echo "  sudo npm install -g eslint_d"

