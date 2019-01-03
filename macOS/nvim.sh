#!/bin/bash
#
# The script init vim!
#
# CreateDate: 2019/1/2
# ChangeDate: 2019/1/2
# Author Mephis Pheies
# Email mephistommm@gmail.com
GENPATH=${PWD%%/macOS}

if type brew > /dev/null ; then
    echo "Brew installed."
else
    echo "Install brew..."
    sh ./brew.sh || exit 1
fi

test -e $HOME/.config/nvim && rm -rf $HOME/.config/nvim
mkdir $HOME/.config/nvim

curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# for my color
git clone https://github.com/MephistoMMM/gruvbox.git  $HOME/.config/nvim/plugged/gruvbox

#for ultisnips
git clone https://github.com/MephistoMMM/USlibrary.git $HOME/.config/nvim/UltiSnips

# for undo
mkdir $HOME/.config/nvim/undodir

chown -R $USER:staff $HOME/.config
cp $GENPATH/src/vimrc $HOME/.config/nvim/init.vim
nvim +source$HOME/.config/nvim/init.vim +PlugInstall +qall

# copy gruvbox
if [ -d "$HOME/.oh-my-zsh" ]; then
    cp $HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh\
       $HOME/.oh-my-zsh
fi

#change mod
chown -R $USER:staff $HOME/.config
