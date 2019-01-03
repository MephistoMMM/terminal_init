#!/bin/bash
#
# The script init item2 and zsh.
#
# CreateDate: 2019/1/2
# ChangeDate: 2019/1/2
# Author Mephis Pheies
# Email mephistommm@gmail.com
ITERM_VERSION=3_2_6
# https://www.iterm2.com/downloads.html
ITERM_URL=https://iterm2.com/downloads/stable/iTerm2-$ITERM_VERSION.zip
TMP_DIR=/tmp/iterm2_`date "+%Y%M%d"`

if type brew > /dev/null ; then
    echo "Brew installed."
else
    echo "Install brew..."
    sh ./brew.sh || exit 1
fi

if [[ ! -d $TMP_DIR ]]; then
    mkdir $TMP_DIR
fi
if [[ ! -d /Applications/iTerm.app ]] && [[ ! -d /Applications/iTerm2.app ]]
then
    # download item2
    wget $ITERM_URL -O $TMP_DIR/iTerm2.zip
    unzip $TMP_DIR/iTerm2.zip
    mv $TMP_DIR/iTerm.app /Applications/iTerm.app
    chown $USER:staff /Applications/iTerm.app
fi

# install zsh
sh ./zsh.sh
