#!/bin/bash
#
# The script init other things!
# --------
# python3 
# python-pip
# python3-pip
# nodejs 7.x
# tree
# htop
# ----------
#
# CreateDate: 2015/11/30
# ChangeDate: 2015/11/30
# Author Mephis Pheies
# Email mephistommm@gmail.com

source $GENPATH/lib/package.sh

if [ $SYSTYPE != 2 ] ; then
    install_packages python3 
    install_packages python3-pip python-pip

    if [ $SYSTYPE == 1 ] ; then
        install_packages nodejs npm
    else
        curl -sL https://deb.nodesource.com/setup_8.x | /bin/bash -
        install_packages nodejs
    fi
else
    ./init.d/centos_python3.sh
    curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
    install_packages nodejs
fi

install_packages tree htop
