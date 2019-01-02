#!/bin/bash
#
# The script init zsh!
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
    sh ./brew.sh
fi

brew install zsh

#zsh and oh my zsh
test -e $HOME/.oh-my-zsh && rm -rf $HOME/.oh-my-zsh
test -e $HOME/.zshrc && rm $HOME/.zshrc

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

cp ./src/zshrc $HOME/.zshrc\
    && cp $GENPATH/src/zshenv $HOME/.zshenv\
    && cp $GENPATH/src/zshenv $HOME/.zshfunc\
    && cp $GENPATH/src/mephis-magic.zsh-theme $HOME/.oh-my-zsh/themes/ \
    && cp $GENPATH/src/divider.png $HOME/.oh-my-zsh/divider.png

# copy gruvbox
if [ -f "$HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh" ]; then
    cp $HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh\
       $HOME/.oh-my-zsh
fi

chown $USER:staff $HOME/.zshrc \
    && chown $USER:staff $HOME/.zshenv \
    && chown $USER:staff $HOME/.zshfunc \
    && chown -R $USER:staff $HOME/.oh-my-zsh \
    && chsh -s /bin/zsh $USER
