#!/bin/bash
#
# The script init powerlinefonts!
# for my vim plugins
#  
# CreateDate: 2015/11/30
# ChangeDate: 2015/11/30
# Author Mephis Pheies
# Email mephistommm@gmail.com

export FONTS_PATH=$GENPATH/tmp/fonts

if [ ! -e $FONTS_PATH ]; then 
    mkdir $FONTS_PATH
fi

git clone https://github.com/powerline/fonts.git $FONTS_PATH/powerlinefonts \
        && $FONTS_PATH/powerlinefonts/install.sh \
        && chmod -R $INIT_USER:$INIT_USER $INIT_HOME/.fonts

rm -rf $FONTS_PATH/powerlinefonts
