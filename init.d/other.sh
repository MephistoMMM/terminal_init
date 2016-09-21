#!/bin/bash
#
# The script init other things!
# --------
# python3 
# python-pip
# python3-pip
# w3m
# nodejs 6.x
# ----------
#
# CreateDate: 2015/11/30
# ChangeDate: 2015/11/30
# Author Mephis Pheies
# Email mephistommm@gmail.com

source $GENPATH/lib/package.sh

install_packages python3 
install_packages python3-pip python-pip
install_packages w3m

if [ $IS_ARCHLINUX == "1" ] ; then
    install_packages nodejs npm
else
    curl -sL https://deb.nodesource.com/setup_6.x | /bin/bash -c -
    install_packages nodejs
fi
