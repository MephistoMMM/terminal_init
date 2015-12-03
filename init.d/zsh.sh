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

git clone https://github.com/robbyrussell/oh-my-zsh.git $INIT_HOME/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $INIT_HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting\

cp ./src/zshrc.linux $INIT_HOME/.zshrc\
    && chown $INIT_USER:$INIT_USER $INIT_HOME/.zshrc \
    && chown -R $INIT_USER:$INIT_USER $INIT_HOME/.oh-my-zsh \
    && chsh -s /bin/zsh $INIT_USER
