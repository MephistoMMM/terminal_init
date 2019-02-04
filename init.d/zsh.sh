#!/bin/bash
#
# The script init zsh!
#  
# CreateDate: 2015/11/30
# ChangeDate: 2015/11/30
# Author Mephis Pheies
# Email mephistommm@gmail.com
source $GENPATH/lib/package.sh

install_packages zsh

#zsh and oh my zsh
test -e $INIT_HOME/.oh-my-zsh && rm -rf $INIT_HOME/.oh-my-zsh
test -e $INIT_HOME/.zshrc && rm $INIT_HOME/.zshrc

# cope gruvbox/gruvbox_256palette.sh
test -e $INIT_HOME/.vim/bundle/gruvbox && \
    cp $INIT_HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh $INIT_HOME/.oh-my-zsh/
test -e $INIT_HOME/.config/nvim/plugged/gruvbox && \
    cp $INIT_HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh $INIT_HOME/.oh-my-zsh/

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $INIT_HOME/.oh-my-zsh
git clone --depth=1 git://github.com/zsh-users/zsh-syntax-highlighting.git $INIT_HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

cp ./src/zshrc $INIT_HOME/.zshrc\
    && cp ./src/zshenv $INIT_HOME/.zshenv\
    && cp ./src/zshenv $INIT_HOME/.zshfunc\
    && cp ./src/mephis-magic.zsh-theme $INIT_HOME/.oh-my-zsh/themes/ \
    && cp ./src/divider.png $INIT_HOME/.oh-my-zsh/divider.png

# copy gruvbox
if [ -f "$INIT_HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh" ]; then
    cp $INIT_HOME/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh\
       $INIT_HOME/.oh-my-zsh
fi

chown $INIT_USER:$INIT_USER $INIT_HOME/.zshrc \
    && chown $INIT_USER:$INIT_USER $INIT_HOME/.zshenv \
    && chown $INIT_USER:$INIT_USER $INIT_HOME/.zshfunc \
    && chown -R $INIT_USER:$INIT_USER $INIT_HOME/.oh-my-zsh \
    && chsh -s /bin/zsh $INIT_USER
